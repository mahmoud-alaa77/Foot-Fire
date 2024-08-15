
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:foot_fire/core/helpers/helper_functions.dart';

class ShortVideoContainer extends StatelessWidget {
  const ShortVideoContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
                    margin: const EdgeInsetsDirectional.symmetric(horizontal: 16,vertical: 8),
                      width: double.infinity,
                      height: 200.h,
                      child: ClipRRect(
                          borderRadius: BorderRadius.circular(16),
                          child: CachedNetworkImage(
                            errorWidget: (context, url, error) {
                              return const Center(child: CircularProgressIndicator());
                            },
                            imageUrl: HelperFunctions().getImageUrl(),
                            fit: BoxFit.cover,
                          )),
                    );
  }
}