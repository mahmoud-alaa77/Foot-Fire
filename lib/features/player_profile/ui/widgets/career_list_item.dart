import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/widgets.dart';
import 'package:foot_fire/core/helpers/constants.dart';
import 'package:foot_fire/core/helpers/spaces.dart';
import 'package:foot_fire/core/theming/app_text_styles.dart';
import 'package:foot_fire/features/player_profile/data/models/career_model.dart';

class CareerListItem extends StatelessWidget {
  final Formerteam team;
  const CareerListItem({super.key, required this.team});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(100),
          child: CachedNetworkImage(
            imageUrl: team.strBadge ?? MyImages.emptyImage,
            width: 45,
            height: 45,
            fit: BoxFit.cover,
          ),
        ),
        horizontalSpace(8),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                team.strFormerTeam ?? "--",
                style: AppTextStyles.font14OrangeW400.copyWith(fontSize: 16),
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
              verticalSpace(2),
              Text(
                "${team.strMoveType} (${team.strJoined}-${team.strDeparted})",
                style: AppTextStyles.font14GreyW400,
              )
            ],
          ),
        )
      ],
    );
  }
}
