import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:foot_fire/core/helpers/spaces.dart';
import 'package:foot_fire/core/theming/app_text_styles.dart';
import 'package:foot_fire/core/widgets/app_text_field.dart';
import 'package:foot_fire/features/news/logic/cubit/news_cubit.dart';
import 'package:foot_fire/features/news/ui/widgets/news_list_bloc_builder.dart';

class NewsScreenBody extends StatelessWidget {
  const NewsScreenBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding:
            const EdgeInsetsDirectional.symmetric(horizontal: 16, vertical: 8),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            verticalSpace(12),
            AppTextFieldWidget(
              hintText: "add Keyword...",
              prefixIcon: Icons.text_fields_outlined,
              onSubmitted: (val) {
                context.read<NewsCubit>().getNews(val);
              },
            ),
            verticalSpace(12),
            Text(
              "Top News 🔥🔥",
              style: AppTextStyles.font20WhiteW800,
            ),
            verticalSpace(16),
            const NewsListBlocBuilder(),
          ],
        ),
      ),
    );
  }
}

