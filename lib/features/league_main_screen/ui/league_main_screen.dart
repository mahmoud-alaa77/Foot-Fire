import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:foot_fire/core/helpers/constants.dart';
import 'package:foot_fire/core/helpers/helper_functions.dart';
import 'package:foot_fire/core/theming/app_colors.dart';
import 'package:foot_fire/features/home/data/models/league_model.dart';
import 'package:foot_fire/features/league_details/ui/league_details_screen.dart';
import 'package:foot_fire/features/league_main_screen/ui/widgets/top_bar.dart';
import 'package:foot_fire/features/league_matches/logic/cubit/match_cubit.dart';
import 'package:foot_fire/features/league_matches/ui/matches_screen_body.dart';
import 'package:foot_fire/features/league_table/logic/cubit/table_cubit.dart';
import 'package:foot_fire/features/league_table/ui/table_screen_body.dart';
import 'package:foot_fire/features/league_teams/logic/cubit/team_cubit.dart';
import 'package:foot_fire/features/league_teams/ui/teams_screen_body.dart';

class LeagueMainScreen extends StatefulWidget {
  final Countries leagueModel;
  const LeagueMainScreen({super.key, required this.leagueModel});

  @override
  State<LeagueMainScreen> createState() => _LeagueMainScreenState();
}

class _LeagueMainScreenState extends State<LeagueMainScreen> {
  @override
  void initState() {
    super.initState();
    BlocProvider.of<TableCubit>(context).getTableForLeague(
        widget.leagueModel.idLeague ?? "0",
        widget.leagueModel.currentSeason ?? "0");
        BlocProvider.of<MatchCubit>(context).getTableForLeague(
        widget.leagueModel.idLeague ?? "0",
        widget.leagueModel.currentSeason ?? "0");
         BlocProvider.of<TeamCubit>(context).getTeamsInLeague(HelperFunctions().replaceSpaces(widget.leagueModel.leagueName?? ""));
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4,
      child: SafeArea(
          child: Scaffold(
              appBar: AppBar(
                automaticallyImplyLeading: false,
                leadingWidth: 0,
                toolbarHeight: 120.h,
                title: TopBar(
                  countryName:
                      widget.leagueModel.leagueCountry ?? "",
                  currentSeason:
                      widget.leagueModel.currentSeason ?? "",
                  leagueLogo: widget.leagueModel.badgeImage ??
                      MyImages.emptyImage,
                  leagueName: widget.leagueModel.leagueName ?? "",
                ),
                backgroundColor: AppColors.darkGrayColor,
                elevation: 0,
                bottom: TabBar(
                  //isScrollable: true,
                  tabs: tabs,
                  dividerColor: Colors.white,
                  labelColor: AppColors.orangeColor,
                  indicatorColor: AppColors.orangeColor,
                ),
              ),
              backgroundColor: AppColors.backGroundBlackColor,
              body: TabBarView(children: [
                LeagueDetailsScreenBody(
                  leagueModel: widget.leagueModel,
                ),
                const TableScreenBody(),
                const TeamsScreenBody(),
                const MatchesScreenBody(),
              ]))),
    );
  }
}

List<Tab> tabs = [
  const Tab(text: 'Details'),
  const Tab(text: 'Table'),
  const Tab(text: 'Teams'),
  const Tab(text: 'Matches')
];
