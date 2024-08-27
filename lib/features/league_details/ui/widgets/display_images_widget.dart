import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:foot_fire/core/helpers/constants.dart';
import 'package:foot_fire/core/theming/app_colors.dart';

class DisplayImages extends StatelessWidget {
  final List<String?> imagesList;
  const DisplayImages({super.key, required this.imagesList});

  @override
  Widget build(BuildContext context) {
    return CarouselSlider.builder(
      itemCount: imagesList.length,
      itemBuilder: (context, index, realIndex) {
        return Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadiusDirectional.circular(16),
              color: AppColors.darkGrayColor),
          child: ClipRRect(
            borderRadius: BorderRadiusDirectional.circular(16),
            child: CachedNetworkImage(
              errorWidget: (context, url, error) {
                return Container(
                  decoration: const BoxDecoration(color: AppColors.lightGrayColor),
                  child: const Center(
                    child: Text("No Image Found !"),
                  ),
                );
              },
              imageUrl: imagesList[index] ?? MyImages.emptyImage,
              height: MediaQuery.of(context).size.height / 3.2,
              width: double.infinity,
              fit: BoxFit.fill,
            ),
          ),
        );
      },
      options: CarouselOptions(
        aspectRatio: 10 / 7,
        viewportFraction: 1,
        initialPage: 0,
        enableInfiniteScroll: true,
        autoPlay: true,
        autoPlayInterval: const Duration(seconds: 3),
        autoPlayAnimationDuration: const Duration(milliseconds: 800),
        autoPlayCurve: Curves.fastOutSlowIn,
        enlargeCenterPage: true,
        enlargeFactor: 0.3,
      ),
    );
  }
}
