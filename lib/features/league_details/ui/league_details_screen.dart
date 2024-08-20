import 'package:flutter/material.dart';
import 'package:foot_fire/core/helpers/spaces.dart';
import 'package:foot_fire/features/home/data/models/league_model.dart';
import 'package:foot_fire/features/league_details/ui/widgets/custom_description_widget.dart';
import 'package:foot_fire/features/league_details/ui/widgets/display_images_widget.dart';
import 'package:foot_fire/features/league_details/ui/widgets/more_details.dart';
import 'package:foot_fire/features/league_details/ui/widgets/social_media_icons.dart';

class LeagueDetailsScreenBody extends StatelessWidget {
  final Countries leagueModel;
  const LeagueDetailsScreenBody({super.key, required this.leagueModel});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                verticalSpace(12),
                DisplayImages(
                  imagesList: [
                    leagueModel.posterImage,
                    leagueModel.bannerImage,
                    leagueModel.cupImage,
                    leagueModel.badgeImage
                  ],
                ),
                verticalSpace(12),
                DescriptionWidget(
                  desc: leagueModel.descriptionEN,
                ),
                verticalSpace(24),
                MoreDetailsWidget(
                  keyText: "First Year:",
                  valueText: leagueModel.firstYear ?? "",
                ),
                verticalSpace(8),
                MoreDetailsWidget(
                  keyText: "Current season:",
                  valueText: leagueModel.currentSeason ?? "",
                ),
                verticalSpace(24),
                SocialMediaIcons(
                  facebookUrl: leagueModel.strFacebook,
                  twitterUrl: leagueModel.strTwitter,
                  instagramUrl: leagueModel.strInstagram,
                  youTubeUrl: leagueModel.strYoutube,
                  websiteUrl: leagueModel.strWebsite,
                ),
                verticalSpace(24),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
