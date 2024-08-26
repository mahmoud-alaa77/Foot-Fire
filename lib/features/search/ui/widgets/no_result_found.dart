import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:foot_fire/core/theming/app_text_styles.dart';

class NoResultFound extends StatelessWidget {
  const NoResultFound({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(
          Icons.search_off,
          size: 35.r,
        ),
        Text(
          "No result founded",
          style: AppTextStyles.font18WhiteW400,
        ),
      ],
    );
  }
}
