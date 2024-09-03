import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:foot_fire/core/theming/app_colors.dart';
import 'package:foot_fire/features/home/ui/widgets/favorite_player/player_details_screen_body.dart';
import 'package:foot_fire/features/home/ui/widgets/favorite_player/player_details_shimmer_loading.dart';
import 'package:foot_fire/features/player_profile/logic/cubit/player_cubit.dart';

class PlayerDetailsScreen extends StatefulWidget {
  final String playerID;
  const PlayerDetailsScreen({super.key, required this.playerID});

  @override
  State<PlayerDetailsScreen> createState() => _PlayerDetailsScreenState();
}

class _PlayerDetailsScreenState extends State<PlayerDetailsScreen> {
  @override
  @override
  void initState() {
    context.read<PlayerCubit>().getPlayerDetailsByID(widget.playerID);

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: AppColors.backGroundBlackColor,
        body: BlocBuilder<PlayerCubit, PlayerState>(
          buildWhen: (previous, current) => current is PlayerDetailsLoaded,
          builder: (context, state) {
            if (state is PlayerDetailsLoaded) {
              return PlayerDetailsScreenBody(
                player: state.playerModel.playersList![0],
              );
            } else {
              return const PlayerDetailsShimmerLoding();
            }
          },
        ),
      ),
    );
  }
}
