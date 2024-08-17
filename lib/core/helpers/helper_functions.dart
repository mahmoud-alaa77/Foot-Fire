import 'dart:math';

import 'package:foot_fire/core/helpers/constants.dart';

class HelperFunctions {
  String getImageUrl() {
    if (animatedImages.isEmpty) {
      return ''; // Or handle empty list as needed
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
}
