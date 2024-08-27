import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:foot_fire/core/helpers/extentions.dart';
import 'package:foot_fire/core/helpers/spaces.dart';
import 'package:foot_fire/core/theming/app_colors.dart';
import 'package:foot_fire/core/theming/app_text_styles.dart';
import 'package:foot_fire/core/widgets/custom_description_widget.dart';
import 'package:foot_fire/core/widgets/custom_divider.dart';
import 'package:foot_fire/core/widgets/social_media_icons.dart';
import 'package:foot_fire/features/league_details/ui/widgets/display_images_widget.dart';
import 'package:foot_fire/features/league_teams/ui/widgets/icon_and_row_widget.dart';
import 'package:foot_fire/features/search/data/models/staduim_model.dart';

class StadiumDetailsScreen extends StatelessWidget {
  final Staduim staduim;
  const StadiumDetailsScreen({super.key, required this.staduim});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsetsDirectional.symmetric(
              horizontal: 16, vertical: 12),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Stack(children: [
                DisplayImages(
                  imagesList: [
                    "${staduim.strThumb}",
                    "${staduim.strFanart1}",
                    "${staduim.strFanart2}",
                    "${staduim.strFanart3}",
                    "${staduim.strFanart4}",
                  ],
                ),
                Positioned(
                    top: 10.h,
                    left: 10.w,
                    child: Container(
                      decoration: BoxDecoration(
                          color: AppColors.darkGrayColor.withOpacity(.5),
                          borderRadius: BorderRadius.circular(12)),
                      child: IconButton(
                          onPressed: () {
                            context.pop();
                          },
                          icon: Icon(
                            Icons.arrow_back,
                            color: const Color.fromARGB(255, 255, 255, 255),
                            size: 30.r,
                          )),
                    )),
              ]),
              verticalSpace(12),
              Text(
                staduim.staduimName ?? "",
                style: AppTextStyles.font24WhiteW700,
              ),
              Text(
                staduim.strCountry ?? "",
                style: AppTextStyles.font16GreyW400,
              ),
              const CustomDivider(),
              staduim.strVenueAlternate != ""
                  ? IconAndRowWidget(
                      icon: Icons.title,
                      title: staduim.strVenueAlternate ?? "",
                    )
                  : const SizedBox.shrink(),
              verticalSpace(8),
              staduim.strLocation != ""
                  ? IconAndRowWidget(
                      icon: Icons.location_on_outlined,
                      title: staduim.strLocation ?? "",
                    )
                  : const SizedBox.shrink(),
              verticalSpace(8),
              staduim.intCapacity != ""
                  ? IconAndRowWidget(
                      icon: Icons.reduce_capacity,
                      title: "Capacity (${staduim.intCapacity})",
                    )
                  : const SizedBox.shrink(),
              verticalSpace(8),
              staduim.strCost != ""
                  ? IconAndRowWidget(
                      icon: Icons.attach_money,
                      title: "Cost (${staduim.strCost})",
                    )
                  : const SizedBox.shrink(),
              const CustomDivider(),
              DescriptionWidget(
                desc: staduim.strDescriptionEN,
              ),
              verticalSpace(16),
              SocialMediaIconsButtons(
                facebookUrl: staduim.strFacebook,
                twitterUrl: staduim.strTwitter,
                instagramUrl: staduim.strInstagram,
                youTubeUrl: staduim.strYoutube,
                websiteUrl: staduim.strWebsite,
              ),
              verticalSpace(16),
            ],
          ),
        ),
      ),
    ));
  }
}
