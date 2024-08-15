import 'package:flutter/material.dart';
import 'package:foot_fire/core/helpers/spaces.dart';
import 'package:foot_fire/core/theming/app_colors.dart';
import 'package:foot_fire/core/theming/app_text_styles.dart';
import 'package:foot_fire/features/home/ui/widgets/country_list_item.dart';
import 'package:foot_fire/features/home/ui/widgets/short_video_container.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<bool> _buttonStates = [];

  @override
  void initState() {
    super.initState();
    // Initialize button states with default values (e.g., false)
    _buttonStates = List.generate(
        16, (_) => false); // Replace 16 with your desired number of buttons
  }

  void _changeButtonColor(int index) {
    setState(() {
      _buttonStates[index] = !_buttonStates[index];
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      backgroundColor: AppColors.backGroundBlackColor,
      appBar: AppBar(
        backgroundColor: AppColors.backGroundBlackColor,
        elevation: 0.0,
        title: Text(
          "Foot Fire🔥⚽",
          style: AppTextStyles.font18WhiteW700,
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.search,color: Colors.white,),
            onPressed: () {},
          ),
        ],
      ),
      body: CustomScrollView(
        slivers: [
          const SliverToBoxAdapter(
            child: ShortVideoContainer(),
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsetsDirectional.symmetric(horizontal: 12),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  verticalSpace(16),
                  Text(
                    "countries 🗺️🚩",
                    style: AppTextStyles.font24WhiteW700,
                  ),
                  verticalSpace(8),
                  ListView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemBuilder: (context, index) {
                      return CountryListItem(
                        isSelected: _buttonStates[index],
                        name: "Egypt",
                        flagImageUrl:
                            "https://www.thesportsdb.com/images/icons/flags/shiny/32/Belgium.png",
                        onPressed: () {
                          _changeButtonColor(index);
                        },
                      );
                    },
                    itemCount: 16,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    ));
  }
}
