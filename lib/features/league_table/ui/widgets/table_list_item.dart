import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:foot_fire/core/helpers/spaces.dart';
import 'package:foot_fire/core/theming/app_colors.dart';
import 'package:foot_fire/core/theming/app_text_styles.dart';

class TableListItem extends StatelessWidget {
  final String rank;
  final String teamName;
  final String logoTeamImage;
  final String play;
  final String win;
  final String lose;
  final String drawUp;
  final String goalsFor;
  final String goalsAgainst;
  final String goalDifference;
  final String points;

  const TableListItem(
      {super.key,
      required this.rank,
      required this.teamName,
      required this.logoTeamImage,
      required this.play,
      required this.win,
      required this.lose,
      required this.drawUp,
      required this.goalsFor,
      required this.goalsAgainst,
      required this.goalDifference,
      required this.points});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding:
          const EdgeInsetsDirectional.symmetric(vertical: 10, horizontal: 8),
      margin: const EdgeInsetsDirectional.symmetric(vertical: 4, horizontal: 8),
      decoration: BoxDecoration(
        border: Border.all(color: AppColors.lightGrayColor),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Row(
        children: [
          Expanded(
            flex: 7,
            child: Row(
              children: [
                Text(rank,style: AppTextStyles.font12WhiteW300,),
                horizontalSpace(4),
                CachedNetworkImage(
                  imageUrl: logoTeamImage,
                  fit: BoxFit.fill,
                  width: 20,
                  height: 20,
                ),
                horizontalSpace(4),
                Flexible(
                  child: Text(
                    teamName,
                    overflow: TextOverflow.ellipsis,
                    maxLines: 2,
                    style: AppTextStyles.font12WhiteW300,
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            flex: 9,
            child: Row(
              children: [
                Expanded(child: Text(play)),
                Expanded(child: Text(win,style: AppTextStyles.font10WhiteW300,)),

                Expanded(child: Text(drawUp,style: AppTextStyles.font10WhiteW300,)),

                Expanded(
                  child: Text(
                    lose,style: AppTextStyles.font10WhiteW300,
                  ),
                ),

                 Expanded(
                  flex: 2,
                  child: Text("$goalsFor/$goalsAgainst",style: AppTextStyles.font10WhiteW300,)),
                Expanded(child: Text(goalDifference,style: AppTextStyles.font10WhiteW300,)),

                Expanded(child: Text(points,style: AppTextStyles.font10WhiteW300,)),
              ],
            ),
          )
        ],
      ),
    );
  }
}
