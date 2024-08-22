import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:foot_fire/core/helpers/extentions.dart';
import 'package:foot_fire/core/theming/app_colors.dart';

class TopImageContainer extends StatelessWidget {
  final String bannerUrl;
  final String logoUrl;
  const TopImageContainer(
      {super.key, required this.bannerUrl, required this.logoUrl});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 240.h,
      child: Stack(
        children: [
          CachedNetworkImage(
            imageUrl: bannerUrl,
            errorWidget: (context, url, error) {
              return Container(
                color: AppColors.lightGrayColor,
                child: const Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.error,size: 35,),
                    Text("No Image Found")
                  ],
                ),
              );
            },
            width: double.infinity,
            height: 200.h,
            fit: BoxFit.fill,
          ),
          Positioned(
            bottom: 0,
            left: 10.w,
            child: CircleAvatar(
              radius: 62.r,
              backgroundColor: AppColors.lightGrayColor,
              child: Container(
                decoration: const BoxDecoration(
                    shape: BoxShape.circle, color: AppColors.darkGrayColor),
                width: 120.w,
                height: 120.h,
                child: Center(
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(0),
                    child: CachedNetworkImage(
                      imageUrl: logoUrl,
                      width: 100,
                      height: 100,
                      fit: BoxFit.fill,
                    ),
                  ),
                ),
              ),
            ),
          ),
          Positioned(
              top: 10.h,
              left: 10.w,
              child: Container(
                decoration: BoxDecoration(
                    color: AppColors.darkGrayColor.withOpacity(.5),
                    borderRadius: BorderRadius.circular(12)),
                child: IconButton(
                    onPressed: () {
                      context.pop();
                    },
                    icon: Icon(
                      Icons.arrow_back,
                      color: const Color.fromARGB(255, 255, 255, 255),
                      size: 30.r,
                    )),
              ))
        ],
      ),
    );
  }
}
