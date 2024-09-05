import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:foot_fire/core/theming/app_colors.dart';
import 'package:foot_fire/core/theming/app_text_styles.dart';

class AppTextFieldWidget extends StatelessWidget {
  final void Function(String)? onChanged;
  final String? hintText;
  final void Function(String)? onSubmitted;
  final IconData prefixIcon;

  const AppTextFieldWidget(
      {super.key,
      this.onChanged,
      required this.hintText,
      this.onSubmitted,
      required this.prefixIcon});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      child: TextSelectionTheme(
        data: const TextSelectionThemeData(
          cursorColor: Colors.white,
          selectionColor: AppColors.backGroundBlackColor,
          selectionHandleColor: AppColors.orangeColor,
        ),
        child: TextField(
          cursorColor: AppColors.darkGrayColor,
          autofocus: false,
          cursorErrorColor: AppColors.orangeColor,
          keyboardAppearance: Brightness.dark,
          decoration: InputDecoration(
            hintText: hintText,
            prefixIcon: Icon(
              prefixIcon,
              size: 30.w,
            ),
            hintStyle: AppTextStyles.font16WhiteW500,
            contentPadding: EdgeInsetsDirectional.symmetric(
                vertical: 16.h, horizontal: 20.w),
            border: const OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(16)),
                borderSide: BorderSide(color: AppColors.lightGrayColor)),
            enabledBorder: const OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(16)),
                borderSide: BorderSide(color: AppColors.darkGrayColor)),
            focusedBorder: const OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(16)),
                borderSide: BorderSide(color: AppColors.lightGrayColor)),
            fillColor: AppColors.lightGrayColor.withOpacity(.3),
            filled: true,
          ),
          onChanged: onChanged,
          onSubmitted: onSubmitted,
        ),
      ),
    );
  }
}
