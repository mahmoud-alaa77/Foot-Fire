import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:foot_fire/core/helpers/spaces.dart';
import 'package:foot_fire/core/theming/app_colors.dart';
import 'package:foot_fire/core/theming/app_text_styles.dart';
import 'package:foot_fire/features/home/ui/widgets/leagues_list_item.dart';

class CountryListItem extends StatelessWidget {
  final void Function()? onPressed;
  final String name;
  final String flagImageUrl;
  final bool isSelected;
  const CountryListItem(
      {super.key,
      this.onPressed,
      required this.name,
      required this.flagImageUrl,
      required this.isSelected});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsetsDirectional.symmetric(horizontal: 4, vertical: 8),
      padding:
          const EdgeInsetsDirectional.symmetric(horizontal: 12, vertical: 8),
      width: double.infinity,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: AppColors.darkGrayColor,
          border: Border.all(width: .1)),
      child: Column(
        children: [
          Row(
            children: [
              Image.network(
                flagImageUrl,
                width: 50,
                height: 50,
                fit: BoxFit.cover,
              ),
              horizontalSpace(8),
              SizedBox(
                width: 220.w,
                child: Flexible(
                  child: Text(
                    name,
                    style: AppTextStyles.font18WhiteW700,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
              ),
              const Spacer(),
              IconButton(
                  onPressed: onPressed,
                  icon: const Icon(
                    Icons.keyboard_arrow_down,
                    color: Colors.white,
                  ))
            ],
          ),
          isSelected
              ? ListView.separated(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: 5,
                  separatorBuilder: (context, index) => verticalSpace(8),
                  itemBuilder: (context, index) {
                    return const LeaguesListItem();
                  },
                )
              : const SizedBox.shrink()
        ],
      ),
    );
  }
}
