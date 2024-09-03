import 'package:flutter/material.dart';
import 'package:foot_fire/core/helpers/helper_functions.dart';
import 'package:foot_fire/core/theming/app_colors.dart';
import 'package:foot_fire/core/widgets/custom_divider.dart';
import 'package:foot_fire/features/player_profile/ui/widgets/key_and_value_column.dart';

class MainDetailsContainer extends StatelessWidget {
  final dynamic player;
  const MainDetailsContainer({super.key, required this.player});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding:
          const EdgeInsetsDirectional.symmetric(vertical: 12, horizontal: 4),
      width: double.infinity,
      //height: 180.h,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        color: AppColors.darkGrayColor,
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              KeyAndValueColumn(
                  keyText: "Country",
                  valueText: player.playerNationality ?? "--"),
              KeyAndValueColumn(
                  keyText: player.dateBorn ?? "--",
                  valueText:
                      "${HelperFunctions().calculateAge(player.dateBorn ?? "--").toString()} Year"),
              KeyAndValueColumn(
                  keyText: "Status", valueText: player.strStatus ?? "--"),
            ],
          ),
          const CustomDivider(),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              KeyAndValueColumn(
                  keyText: "Gender", valueText: player.strGender ?? "--"),
              KeyAndValueColumn(
                  keyText: "Preferred foot",
                  valueText: player.mainFoot ?? '--'),
              KeyAndValueColumn(
                  keyText: "Position", valueText: player.strPosition ?? "--"),
            ],
          ),
          const CustomDivider(),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              KeyAndValueColumn(
                  keyText: "Shirt", valueText: player.playerNumber ?? "--"),
              KeyAndValueColumn(
                  keyText: "Weight", valueText: player.strWeight ?? '--'),
              KeyAndValueColumn(
                  keyText: "Height",
                  valueText: player.strHeight!.length > 5
                      ? player.strHeight?.substring(0, 6) ?? "--"
                      : player.strHeight.toString()),
            ],
          ),
        ],
      ),
    );
  }
}
