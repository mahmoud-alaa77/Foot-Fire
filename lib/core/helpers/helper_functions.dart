import 'dart:math';

import 'package:easy_url_launcher/easy_url_launcher.dart';
import 'package:flutter/material.dart';
import 'package:foot_fire/core/helpers/constants.dart';
import 'package:foot_fire/core/theming/app_colors.dart';
import 'package:intl/intl.dart';
class HelperFunctions {
  String getImageUrl() {
    if (animatedImages.isEmpty) {
      return ''; 
    }

    final random = Random();
    final randomIndex = random.nextInt(animatedImages.length);
    return animatedImages[randomIndex];
  }

  String replaceSpaces(String input) {
    input = input.trim();

    List<String> words = input.split(RegExp(r'\s+'));

    return words.join('_');
  }

  Future<void> launchLink(String url, context) async {
    if (url.isNotEmpty) {
      await EasyLauncher.url(url: "https://$url", mode: Mode.platformDefault);
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
         const SnackBar(
          content: Text('This page not available'),
          backgroundColor: AppColors.lightGrayColor,
          
        ),
      );
    }
  }


String convertTo12HourFormat(String timeString) {
  final format24 = DateFormat('HH:mm:ss');
  final format12 = DateFormat('hh:mm a');
  DateTime time = format24.parse(timeString);
  time = time.add(const Duration(hours: 2));
  return format12.format(time);
}

}
