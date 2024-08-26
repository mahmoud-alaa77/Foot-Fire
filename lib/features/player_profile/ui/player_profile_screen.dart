import 'package:flutter/material.dart';
import 'package:foot_fire/core/helpers/constants.dart';
import 'package:foot_fire/core/helpers/spaces.dart';
import 'package:foot_fire/core/theming/app_colors.dart';
import 'package:foot_fire/core/theming/app_text_styles.dart';
import 'package:foot_fire/core/widgets/social_media_icons.dart';
import 'package:foot_fire/core/widgets/top_image_container.dart';
import 'package:foot_fire/core/widgets/custom_description_widget.dart';
import 'package:foot_fire/features/player_profile/ui/widgets/main_details_container.dart';
import 'package:foot_fire/features/search/data/models/player_model.dart';

class PlayerProfileScreen extends StatelessWidget {
  final Player player;
  const PlayerProfileScreen({super.key, required this.player});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      backgroundColor: AppColors.backGroundBlackColor,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TopImageContainer(
              bannerUrl:
                  player.strBanner ?? player.strFanart1 ?? MyImages.emptyImage,
              logoUrl: player.strCutout ??
                  player.strThumb ??
                  MyImages.unKnownPersonImage,
            ),
            Padding(
              padding: const EdgeInsetsDirectional.symmetric(
                  horizontal: 16, vertical: 4),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    player.playerName ?? "",
                    style: AppTextStyles.font24WhiteW700,
                  ),
                  verticalSpace(4),
                  Text(
                    player.teamName ?? "",
                    style: AppTextStyles.font16GreyW400,
                  ),
                  verticalSpace(12),
                  MainDetailsContainer(
                    player: player,
                  ),
                  verticalSpace(16),
                  DescriptionWidget(
                    desc: player.strDescriptionEN ?? "",
                  ),
                  verticalSpace(16),
                  SocialMediaIconsButtons(
                    facebookUrl: player.strFacebook,
                    twitterUrl: player.strTwitter,
                    instagramUrl: player.strInstagram,
                    youTubeUrl: player.strYoutube,
                    websiteUrl: player.strWebsite,
                  ),
                  verticalSpace(20),
                ],
              ),
            )
          ],
        ),
      ),
    ));
  }
}
