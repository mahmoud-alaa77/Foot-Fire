import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:foot_fire/core/dependancy_injection/di.dart';
import 'package:foot_fire/core/routing/routes.dart';
import 'package:foot_fire/features/favorites/logic/cubit/favorites_cubit.dart';
import 'package:foot_fire/features/home/data/models/league_model.dart';
import 'package:foot_fire/features/home/logic/cubit/country_cubit.dart';
import 'package:foot_fire/features/home/logic/cubit/league_cubit.dart';
import 'package:foot_fire/features/home/ui/all_countries_screen.dart';
import 'package:foot_fire/features/home/ui/main_screen.dart';
import 'package:foot_fire/features/home/ui/player_details_screen.dart';
import 'package:foot_fire/features/league_main_screen/ui/league_main_screen.dart';
import 'package:foot_fire/features/league_matches/data/models/match_model.dart';
import 'package:foot_fire/features/league_matches/logic/cubit/match_cubit.dart';
import 'package:foot_fire/features/league_teams/data/models/team_model.dart';
import 'package:foot_fire/features/league_teams/logic/cubit/team_cubit.dart';
import 'package:foot_fire/features/league_teams/ui/team_screen_details.dart';
import 'package:foot_fire/features/match_details/ui/match_details_screen.dart';
import 'package:foot_fire/features/news/data/repo/news_model.dart';
import 'package:foot_fire/features/news/ui/widgets/news_page_view.dart';
import 'package:foot_fire/features/player_profile/logic/cubit/player_cubit.dart';
import 'package:foot_fire/features/player_profile/ui/player_profile_screen.dart';
import 'package:foot_fire/features/search/data/models/search_player_model.dart';
import 'package:foot_fire/features/search/data/models/staduim_model.dart';
import 'package:foot_fire/features/splash/ui/splash_screen.dart';
import 'package:foot_fire/features/league_table/logic/cubit/table_cubit.dart';
import 'package:foot_fire/features/stadium_details/ui/stadium_details_screen.dart';

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
                          CountryCubit(getIt())..getCustomCountries(),
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
                    BlocProvider(
                      create: (context) =>
                          getIt<FavoritesCubit>()..getFavoritePlayers(),
                    ),
                  ],
                  child: const MainScreen(),
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

      case Routes.teamDetails:
        final Team arg = settings.arguments as Team;

        return MaterialPageRoute(
            builder: (context) => MultiBlocProvider(
                  providers: [
                    BlocProvider(
                      create: (context) => getIt<FavoritesCubit>()
                        ..checkIsFavoriteOrNot(arg.teamName.toString()),
                    ),
                    BlocProvider(
                      create: (context) => getIt<TeamCubit>(),
                    ),
                  ],
                  child: TeamScreenDetails(
                    team: arg,
                  ),
                ));

      case Routes.matchDetailsScreen:
        final Event arg = settings.arguments as Event;

        return MaterialPageRoute(
            builder: (context) => MatchDetailsScreen(
                  event: arg,
                ));
      case Routes.playerDetailsScreen:
        final String arg = settings.arguments as String;

        return MaterialPageRoute(
            builder: (context) => BlocProvider(
                  create: (context) => getIt<PlayerCubit>(),
                  child: PlayerDetailsScreen(
                    playerID: arg,
                  ),
                ));

      case Routes.playerProfile:
        final SearchPlayer arg = settings.arguments as SearchPlayer;

        return MaterialPageRoute(
            builder: (context) => MultiBlocProvider(
                  providers: [
                    BlocProvider(
                      create: (context) => getIt<PlayerCubit>(),
                    ),
                    BlocProvider(
                      create: (context) => getIt<FavoritesCubit>()
                        ..checkIsFavoriteOrNot(arg.playerName.toString()),
                    ),
                  ],
                  child: PlayerProfileScreen(
                    player: arg,
                  ),
                ));

      case Routes.staduimDetails:
        final Staduim arg = settings.arguments as Staduim;

        return MaterialPageRoute(
            builder: (context) => StadiumDetailsScreen(
                  staduim: arg,
                ));
      case Routes.newsDetailsPageView:
        final Article arg = settings.arguments as Article;

        return MaterialPageRoute(
            builder: (context) => NewsPageView(
                  article: arg,
                ));
      case Routes.allCountriesScreen:
        return MaterialPageRoute(
            builder: (context) => MultiBlocProvider(
                  providers: [
                    BlocProvider(
                      create: (context) =>
                          getIt<CountryCubit>()..getAllCountries(),
                    ),
                    BlocProvider(
                      create: (context) => getIt<LeagueCubit>(),
                    ),
                  ],
                  child: const AllCountriesScreen(),
                ));
      default:
        return null;
    }
  }
}
