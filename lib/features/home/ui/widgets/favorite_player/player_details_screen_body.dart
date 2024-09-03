import 'package:flutter/material.dart';
import 'package:foot_fire/core/helpers/extentions.dart';
import 'package:foot_fire/core/helpers/spaces.dart';
import 'package:foot_fire/core/widgets/social_media_icons.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:foot_fire/core/theming/app_colors.dart';
import 'package:foot_fire/core/theming/app_text_styles.dart';
import 'package:foot_fire/core/widgets/custom_description_widget.dart';
import 'package:foot_fire/features/league_details/ui/widgets/display_images_widget.dart';
import 'package:foot_fire/features/player_profile/data/models/player_model.dart';
import 'package:foot_fire/features/player_profile/ui/widgets/main_details_container.dart';
import 'package:foot_fire/features/player_profile/ui/widgets/player_career.dart';
import 'package:foot_fire/features/player_profile/ui/widgets/player_houner.dart';

class PlayerDetailsScreenBody extends StatelessWidget {
  final Player player;
  const PlayerDetailsScreenBody({super.key, required this.player});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding:
            const EdgeInsetsDirectional.symmetric(horizontal: 16, vertical: 8),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(children: [
              DisplayImages(imagesList: [
                player.strThumb != '' ? player.strThumb : null,
                player.strRender != '' ? player.strRender : null,
                player.strCutout != '' ? player.strCutout : null,
                player.strFanart1 != '' ? player.strFanart1 : null,
                player.strFanart2 != '' ? player.strFanart2 : null,
                player.strFanart3 != '' ? player.strFanart3 : null,
                player.strFanart4 != '' ? player.strFanart4 : null,
              ]),
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
            verticalSpace(12),
            PlayerHonour(
              playerId: player.idPlayer ?? "",
            ),
            verticalSpace(12),
            PlayerCareer(playerId: player.idPlayer ?? ''),
            verticalSpace(12),
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
      ),
    );
  }
}
