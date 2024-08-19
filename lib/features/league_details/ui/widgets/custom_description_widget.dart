import 'package:flutter/material.dart';
import 'package:foot_fire/core/helpers/spaces.dart';
import 'package:foot_fire/core/theming/app_colors.dart';
import 'package:foot_fire/core/theming/app_text_styles.dart';

class DescriptionWidget extends StatefulWidget {
  final String? desc;
  const DescriptionWidget({super.key, required this.desc});

  @override
  State<DescriptionWidget> createState() => _DescriptionWidgetState();
}

class _DescriptionWidgetState extends State<DescriptionWidget> {
  bool showMore = false;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Description",
          style: AppTextStyles.font24WhiteW700,
        ),
        verticalSpace(12),
        Text(
          widget.desc ?? "No description",
          maxLines: showMore ? 100 : 10,
          style: AppTextStyles.font16WhiteW500,
        ),
        GestureDetector(
          onTap: () {
            setState(() {
              showMore = !showMore;
            });
          },
          child: Text(
            showMore ? 'Show Less' : 'Show More',
            style: const TextStyle(
              color: AppColors.orangeColor,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ],
    );
  }
}
