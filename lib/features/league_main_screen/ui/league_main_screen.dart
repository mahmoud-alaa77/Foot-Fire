import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:foot_fire/core/helpers/constants.dart';
import 'package:foot_fire/core/theming/app_colors.dart';
import 'package:foot_fire/features/home/data/models/league_model.dart';
import 'package:foot_fire/features/league_details/ui/league_details_screen.dart';
import 'package:foot_fire/features/league_main_screen/ui/widgets/top_bar.dart';

class LeagueMainScreen extends StatelessWidget {
  final LeagueModel leagueModel;
  const LeagueMainScreen({super.key, required this.leagueModel});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4,
      child: SafeArea(
          child: Scaffold(
              appBar: AppBar(
                automaticallyImplyLeading: false,
                leadingWidth: 0,
                toolbarHeight: 120.h,
                title: TopBar(
                  countryName: leagueModel.countries?[0].leagueCountry ?? "",
                  currentSeason: leagueModel.countries?[0].currentSeason ?? "",
                  leagueLogo: leagueModel.countries?[0].badgeImage ??
                      MyImages.emptyImage,
                  leagueName: leagueModel.countries?[0].leagueName ?? "",
                ),
                backgroundColor: AppColors.darkGrayColor,
                elevation: 0,
                bottom: TabBar(
                  tabs: tabs,
                  dividerColor: Colors.white,
                  labelColor: AppColors.orangeColor,
                  indicatorColor: AppColors.orangeColor,
                ),
              ),
              backgroundColor: AppColors.backGroundBlackColor,
              body: TabBarView(children: [
                LeagueDetailsScreenBody(
                  leagueModel: leagueModel,
                ),
                const Center(
                  child: Text("!!!!!!!!"),
                ),
                const Center(
                  child:  Text("!!!!!!!!"),
                ),
                const Center(
                  child: Text("!!!!!!!!"),
                ),
              ]))),
    );
  }
}

List<Tab> tabs = [
  const Tab(text: 'Details'),
  const Tab(text: 'Table'),
  const Tab(text: 'Teams'),
  const Tab(text: 'Events')
];
