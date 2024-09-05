import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:foot_fire/core/helpers/constants.dart';
import 'package:foot_fire/core/helpers/extentions.dart';
import 'package:foot_fire/core/routing/routes.dart';
import 'package:foot_fire/core/widgets/custom_divider.dart';
import 'package:foot_fire/features/news/logic/cubit/news_cubit.dart';
import 'package:foot_fire/features/news/ui/widgets/news_card_item.dart';
import 'package:foot_fire/features/news/ui/widgets/news_list_shimmer_loading.dart';

class NewsListBlocBuilder extends StatelessWidget {
  const NewsListBlocBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NewsCubit, NewsState>(
      builder: (context, state) {
        if (state is NewsSuccess) {
          return ListView.separated(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            separatorBuilder: (context, index) {
              return const CustomDivider();
            },
            itemCount: state.newsModel.articles!.length,
            itemBuilder: (context, index) {
              final article = state.newsModel.articles![index];
              if (state.newsModel.articles!.isEmpty) {
                return const SizedBox.shrink();
              } else {
                return NewsCardItem(
                  onTap: () {
                    context.pushNamed(Routes.newsDetailsPageView,
                        arguments: article);
                  },
                  imageUrl: article.image ?? MyImages.emptyImage,
                  title: article.title ?? "--",
                  source: article.source?.name ?? "",
                  date: article.publishedAt?.substring(0, 10) ?? "--",
                );
              }
            },
          );
        } else if (state is NewsError) {
          return Center(child: Text(state.errorMessage));
        } else {
          return const NewsListShimmerLoading();
        }
      },
    );
  }
}
