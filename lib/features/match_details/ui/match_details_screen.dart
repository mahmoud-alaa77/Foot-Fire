import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:foot_fire/core/helpers/constants.dart';
import 'package:foot_fire/core/helpers/extentions.dart';
import 'package:foot_fire/core/helpers/helper_functions.dart';
import 'package:foot_fire/core/helpers/spaces.dart';
import 'package:foot_fire/core/theming/app_colors.dart';
import 'package:foot_fire/core/theming/app_text_styles.dart';
import 'package:foot_fire/features/league_matches/data/models/match_model.dart';
import 'package:foot_fire/features/match_details/ui/widgets/match_details_column.dart';
import 'package:foot_fire/features/match_details/ui/widgets/score_board.dart';
import 'package:foot_fire/features/match_details/ui/widgets/youtube_player.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class MatchDetailsScreen extends StatefulWidget {
  final Event event;
  const MatchDetailsScreen({super.key, required this.event});

  @override
  State<MatchDetailsScreen> createState() => _MatchDetailsScreenState();
}

late YoutubePlayerController _controller;

class _MatchDetailsScreenState extends State<MatchDetailsScreen> {
  @override
  void initState() {
    super.initState();

    _controller = YoutubePlayerController(
      initialVideoId: widget.event.strVideo == null
          ? 'dVCHcU--9aI'
          : HelperFunctions().cutAfterEquals(widget.event.strVideo.toString()),
      flags: const YoutubePlayerFlags(
        autoPlay: false,
        showLiveFullscreenButton: false,
        isLive: false,
        loop: false,
      ),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Stack(children: [
                CachedNetworkImage(
                  imageUrl: widget.event.strThumb ??
                      widget.event.strPoster ??
                      MyImages.emptyImage,
                  width: double.infinity,
                  fit: BoxFit.fill,
                  height: 200.h,
                ),
                _buildBackButton(context),
              ]),
              verticalSpace(16),
              Align(
                alignment: Alignment.center,
                child: Text(
                  "${widget.event.leagueName ?? "---"} (${widget.event.strSeason})",
                  style: AppTextStyles.font18WhiteW400,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
              verticalSpace(16),
              ScoreBoard(event: widget.event),
              verticalSpace(16),
              MatchDetailsColumn(event: widget.event),
              verticalSpace(16),
              Text(
                "    Watch the highlights",
                style: AppTextStyles.font18OrangeW400,
              ),
              YouTubePlayerWidget(
                controller: _controller,
              ),
              verticalSpace(16),
            ],
          ),
        ),
      ),
    );
  }
}

Widget _buildBackButton(BuildContext context) {
  return Positioned(
    top: 10.h,
    left: 10.w,
    child: Container(
      decoration: BoxDecoration(
        color: AppColors.darkGrayColor.withOpacity(.5),
        borderRadius: BorderRadius.circular(12),
      ),
      child: IconButton(
        onPressed: () => context.pop(),
        icon: Icon(
          Icons.arrow_back,
          color: Colors.white,
          size: 30.r,
        ),
      ),
    ),
  );
}
