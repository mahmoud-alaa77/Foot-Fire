import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:foot_fire/core/helpers/constants.dart';
import 'package:foot_fire/core/helpers/spaces.dart';
import 'package:foot_fire/core/theming/app_colors.dart';
import 'package:foot_fire/core/theming/app_text_styles.dart';
import 'package:foot_fire/core/widgets/custom_description_widget.dart';
import 'package:foot_fire/core/widgets/social_media_icons.dart';
import 'package:foot_fire/core/widgets/top_image_container.dart';
import 'package:foot_fire/features/favorites/data/models/favorite_item_mode.dart';
import 'package:foot_fire/features/league_teams/data/models/team_model.dart';
import 'package:foot_fire/features/league_teams/logic/cubit/team_cubit.dart';
import 'package:foot_fire/features/league_teams/ui/widgets/icon_and_row_widget.dart';
import 'package:foot_fire/features/league_teams/ui/widgets/shirts_list_bloc_builder.dart';

class TeamScreenDetails extends StatefulWidget {
  final Team team;
  const TeamScreenDetails({super.key, required this.team});

  @override
  State<TeamScreenDetails> createState() => _TeamScreenDetailsState();
}

class _TeamScreenDetailsState extends State<TeamScreenDetails> {
  @override
  void initState() {
    context.read<TeamCubit>().getShirtByTeamID(widget.team.idTeam.toString());

    super.initState();
  }

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
                favoriteItem: FavoriteItemModel(
                    title: widget.team.teamName ?? "",
                    subTitle: widget.team.strCountry ?? "",
                    imageUrl: widget.team.strBadge ??
                        widget.team.strLogo ??
                        MyImages.emptyImage,
                    category: "team"),
                bannerUrl: widget.team.strBanner.toString(),
                logoUrl: widget.team.strBadge ?? MyImages.emptyImage,
              ),
              Padding(
                padding: const EdgeInsetsDirectional.symmetric(
                    horizontal: 16, vertical: 4),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      widget.team.teamName ?? "",
                      style: AppTextStyles.font24WhiteW700,
                    ),
                    verticalSpace(12),
                    IconAndRowWidget(
                      icon: Icons.title,
                      title: widget.team.teamAlternateName ?? "",
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
                            widget.team.stadiumName ?? "",
                            style: AppTextStyles.font14GreyW400,
                          ),
                        ),
                        Text(
                          " (capacity ${widget.team.intStadiumCapacity.toString()})",
                          style: AppTextStyles.font14OrangeW400,
                        ),
                      ],
                    ),
                    verticalSpace(8),
                    IconAndRowWidget(
                      icon: Icons.gps_fixed,
                      title: widget.team.lLocation ?? "",
                    ),
                    verticalSpace(16),
                    DescriptionWidget(
                      desc: widget.team.strDescriptionEN ?? "",
                    ),
                    verticalSpace(32),
                    const ShirtsListBlocBuilder(),
                    SocialMediaIconsButtons(
                      facebookUrl: widget.team.strFacebook,
                      twitterUrl: widget.team.strTwitter,
                      instagramUrl: widget.team.strInstagram,
                      youTubeUrl: widget.team.strYoutube,
                      websiteUrl: widget.team.strWebsite,
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
