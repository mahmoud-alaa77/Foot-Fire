import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:foot_fire/core/helpers/constants.dart';
import 'package:foot_fire/core/helpers/spaces.dart';
import 'package:foot_fire/core/theming/app_text_styles.dart';
import 'package:foot_fire/features/league_details/ui/widgets/custom_description_widget.dart';
import 'package:foot_fire/features/league_details/ui/widgets/social_media_icons.dart';
import 'package:foot_fire/features/league_teams/data/models/team_model.dart';
import 'package:foot_fire/features/league_teams/ui/widgets/icon_and_row_widget.dart';
import 'package:foot_fire/features/league_teams/ui/widgets/top_Image_container.dart';

class TeamScreenDetails extends StatelessWidget {
  final Team team;
  const TeamScreenDetails({super.key, required this.team});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TopImageContainer(
                bannerUrl: team.strBanner.toString(),
                logoUrl: team.strBadge ?? MyImages.emptyImage,
              ),
              Padding(
                padding: const EdgeInsetsDirectional.symmetric(
                    horizontal: 16, vertical: 4),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      team.teamName ?? "",
                      style: AppTextStyles.font24WhiteW700,
                    ),
                    verticalSpace(12),
                    IconAndRowWidget(
                      icon: Icons.title,
                      title: team.teamAlternateName ?? "",
                    ),
                    verticalSpace(8),
                    Row(
                      children: [
                        const Icon(
                          Icons.stadium_rounded,
                        ),
                        horizontalSpace(8),
                        Flexible(
                          child: Text(
                            team.stadiumName ?? "",
                            style: AppTextStyles.font14GreyW400,
                          ),
                        ),
                        Text(
                          " (capacity ${team.intStadiumCapacity.toString()})",
                          style: AppTextStyles.font14OrangeW400,
                        ),
                      ],
                    ),
                    verticalSpace(8),
                    IconAndRowWidget(
                      icon: Icons.gps_fixed,
                      title: team.lLocation ?? "",
                    ),
                    verticalSpace(16),
                     DescriptionWidget(
                      desc:team.strDescriptionEN ?? "",
                    ),
                    verticalSpace(24),
                   team.strEquipment !=null ? Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        CachedNetworkImage(
                          imageUrl:
                              team.strEquipment.toString(),
                          width: 200.h,
                          height: 200.h,
                          fit: BoxFit.fill,
                        ),
                      ],
                    ) : const SizedBox.shrink(),
                    verticalSpace(24),
                     SocialMediaIcons(
                      facebookUrl: team.strFacebook,
                      twitterUrl: team.strTwitter,
                      instagramUrl: team.strInstagram,
                      youTubeUrl: team.strYoutube,
                      websiteUrl: team.strWebsite,
                    ),
                    verticalSpace(16),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
