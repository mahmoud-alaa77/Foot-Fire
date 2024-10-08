import 'package:flutter/material.dart';
import 'package:foot_fire/core/helpers/constants.dart';
import 'package:foot_fire/core/helpers/helper_functions.dart';

class SocialMediaIconsButtons extends StatelessWidget {
  final String? facebookUrl;
  final String? twitterUrl;
  final String? instagramUrl;
  final String? youTubeUrl;
  final String? websiteUrl;
  const SocialMediaIconsButtons(
      {super.key,
      this.facebookUrl,
      this.twitterUrl,
      this.instagramUrl,
      this.youTubeUrl,
      this.websiteUrl});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        SocialMediaImageButton(
          image: MyImages.facebookImage,
          urlText: facebookUrl.toString(),
        ),
        SocialMediaImageButton(
          image: MyImages.instagramImage,
          urlText: instagramUrl.toString(),
        ),
        SocialMediaImageButton(
          image: MyImages.twitterImage,
          urlText: twitterUrl.toString(),
        ),
        SocialMediaImageButton(
          image: MyImages.youTubeImage,
          urlText: youTubeUrl.toString(),
        ),
        SocialMediaImageButton(
          image: MyImages.webSiteImage,
          urlText: websiteUrl.toString(),
        ),
      ],
    );
  }
}

class SocialMediaImageButton extends StatelessWidget {
  final String urlText;
  final String image;
  final double? width;
    final double? height;

  const SocialMediaImageButton(
      {super.key, required this.urlText, required this.image, this.width, this.height});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () async {
        HelperFunctions().launchLink(urlText, context);
      },
      child: Container(
        width:width ?? 50,
        height:height?? 50,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          image: DecorationImage(
            image: AssetImage(image),
          ),
        ),
      ),
    );
  }
}
