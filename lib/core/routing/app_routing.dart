import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:foot_fire/core/dependancy_injection/di.dart';
import 'package:foot_fire/core/routing/routes.dart';
import 'package:foot_fire/features/home/data/models/league_model.dart';
import 'package:foot_fire/features/home/logic/cubit/country_cubit.dart';
import 'package:foot_fire/features/home/logic/cubit/league_cubit.dart';
import 'package:foot_fire/features/home/ui/home_screen.dart';
import 'package:foot_fire/features/league_main_screen/ui/league_main_screen.dart';
import 'package:foot_fire/features/league_matches/logic/cubit/match_cubit.dart';
import 'package:foot_fire/features/league_teams/logic/cubit/team_cubit.dart';
import 'package:foot_fire/features/splash/ui/splash_screen.dart';
import 'package:foot_fire/features/league_table/logic/cubit/table_cubit.dart';

class AppRouting {
  Route? genrateRoute(RouteSettings settings) {
    switch (settings.name) {
      case Routes.splashScreen:
        return MaterialPageRoute(builder: (context) => const SplashScreen());

      // case Routes.onBoarding:
      //   return MaterialPageRoute(
      //       builder: (context) => const OnboardingScreen());

      case Routes.home:
        return MaterialPageRoute(
            builder: (context) => MultiBlocProvider(
                  providers: [
                    BlocProvider(
                      create: (context) =>
                          CountryCubit(getIt())..getAllCountries(),
                    ),
                    BlocProvider(
                      create: (context) => getIt<LeagueCubit>(),
                    ),
                    BlocProvider(
                      create: (context) => getIt<TableCubit>(),
                    ),
                    BlocProvider(
                      create: (context) => getIt<MatchCubit>(),
                    ),
                    BlocProvider(
                      create: (context) => getIt<TeamCubit>(),
                    ),
                  ],
                  child: const HomeScreen(),
                ));

      case Routes.leagueMainScreen:
        final Countries arg = settings.arguments as Countries;
        return MaterialPageRoute(
            builder: (context) => MultiBlocProvider(
                  providers: [
                    BlocProvider(
                      create: (context) => getIt<TableCubit>(),
                    ),
                    BlocProvider(
                      create: (context) => getIt<MatchCubit>(),
                    ),
                    BlocProvider(
                      create: (context) => getIt<TeamCubit>(),
                    ),
                  ],
                  child: LeagueMainScreen(
                    leagueModel: arg,
                  ),
                ));
      default:
        return null;
    }
  }
}
