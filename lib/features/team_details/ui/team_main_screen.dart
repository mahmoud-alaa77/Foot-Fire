import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:foot_fire/core/dependancy_injection/di.dart';
import 'package:foot_fire/core/helpers/constants.dart';
import 'package:foot_fire/core/theming/app_colors.dart';
import 'package:foot_fire/features/league_main_screen/ui/widgets/top_bar.dart';
import 'package:foot_fire/features/league_teams/data/models/team_model.dart';
import 'package:foot_fire/features/team_details/logic/cubit/all_players_cubit.dart';
import 'package:foot_fire/features/team_details/ui/team_details_screen_body.dart';
import 'package:foot_fire/features/team_details/ui/team_players_screen_body.dart';

class TeamMainScreen extends StatelessWidget {
  final Team team;
  const TeamMainScreen({super.key, required this.team});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: SafeArea(
        child: Scaffold(
            appBar: AppBar(
              automaticallyImplyLeading: false,
              leadingWidth: 0,
              toolbarHeight: 120.h,
              title: TopBar(
                countryName: team.teamName ?? "",
                currentSeason: team.strCountry ?? "",
                leagueLogo: team.strBadge ??
                    team.strLogo ??
                    MyImages.unKnownPersonImage,
                leagueName: team.leagueName ?? "",
              ),
              backgroundColor: AppColors.darkGrayColor,
              elevation: 0,
              bottom: TabBar(
                tabs: tabs,
                dividerColor: Colors.white,
                labelColor: AppColors.orangeColor,
                indicatorColor: AppColors.orangeColor,
              ),
            ),
            body: TabBarView(children: [
              TeamDetailsScreenBody(
                team: team,
              ),
              BlocProvider(
                create: (context) => getIt<AllPlayersCubit>()..getAllPlayers(team.idTeam??""),
                child: const TeamPlayersScreenBody(),
              ),
            ])),
      ),
    );
  }
}

List<Tab> tabs = [
  const Tab(text: 'Details'),
  const Tab(text: 'Players'),
];
