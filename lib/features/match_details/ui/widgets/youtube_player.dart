import 'package:flutter/material.dart';
import 'package:foot_fire/core/theming/app_colors.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class YouTubePlayerWidget extends StatelessWidget {
  final YoutubePlayerController controller;
  const YouTubePlayerWidget({
    super.key,
    required this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(24),
        child: YoutubePlayer(
          controller: controller,
          showVideoProgressIndicator: true,
          bottomActions: const [
            CurrentPosition(),
            ProgressBar(
              isExpanded: true,
              colors: ProgressBarColors(
                backgroundColor: Colors.white,
                playedColor: AppColors.orangeColor,
                handleColor: AppColors.orangeColor,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
