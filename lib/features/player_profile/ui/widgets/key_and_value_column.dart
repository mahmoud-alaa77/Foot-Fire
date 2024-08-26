import 'package:flutter/material.dart';
import 'package:foot_fire/core/helpers/spaces.dart';
import 'package:foot_fire/core/theming/app_text_styles.dart';

class KeyAndValueColumn extends StatelessWidget {
  final String keyText;
  final String valueText;
  const KeyAndValueColumn(
      {super.key, required this.keyText, required this.valueText});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        children: [
          Text(
            valueText,
            style: valueText.length > 12
                ? AppTextStyles.font14WhiteW500
                : AppTextStyles.font16WhiteW500,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
          verticalSpace(4),
          Text(
            keyText,
            style: AppTextStyles.font14GreyW400,
          ),
          verticalSpace(4),
        ],
      ),
    );
  }
}
