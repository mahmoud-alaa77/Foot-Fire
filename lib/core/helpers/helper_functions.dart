import 'dart:math';

import 'package:foot_fire/core/helpers/constants.dart';


class HelperFunctions {


  String getImageUrl(){
 if (animatedImages.isEmpty) {
    return ''; // Or handle empty list as needed
  }

  final random = Random();
  final randomIndex = random.nextInt(animatedImages.length);
  return animatedImages[randomIndex];
  }
}




