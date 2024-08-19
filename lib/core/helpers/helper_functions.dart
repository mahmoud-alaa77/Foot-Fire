import 'dart:math';

import 'package:easy_url_launcher/easy_url_launcher.dart';
import 'package:flutter/material.dart';
import 'package:foot_fire/core/helpers/constants.dart';

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
          content: Text('There was an error, try again later'),
        ),
      );
    }
  }
}
