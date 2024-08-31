import 'package:dio/dio.dart';
import 'package:foot_fire/core/helpers/database_helper.dart';
import 'package:foot_fire/core/networking/api_services.dart';
import 'package:foot_fire/features/favorites/data/repos/favorites_repo.dart';
import 'package:foot_fire/features/favorites/logic/cubit/favorites_cubit.dart';
import 'package:foot_fire/features/home/data/repos/home_repo.dart';
import 'package:foot_fire/features/home/logic/cubit/country_cubit.dart';
import 'package:foot_fire/features/home/logic/cubit/league_cubit.dart';
import 'package:foot_fire/features/league_matches/data/repos/match_repo.dart';
import 'package:foot_fire/features/league_matches/logic/cubit/match_cubit.dart';
import 'package:foot_fire/features/league_table/data/repos/table_repo.dart';
import 'package:foot_fire/features/league_table/logic/cubit/table_cubit.dart';
import 'package:foot_fire/features/league_teams/data/repos/team_repo.dart';
import 'package:foot_fire/features/league_teams/logic/cubit/team_cubit.dart';
import 'package:foot_fire/features/player_profile/data/repos/player_repo.dart';
import 'package:foot_fire/features/player_profile/logic/cubit/player_cubit.dart';
import 'package:foot_fire/features/search/data/repos/search_repo.dart';
import 'package:foot_fire/features/search/logic/cubit/search_cubit.dart';
import 'package:foot_fire/features/team_details/data/repos/all_players_repo.dart';
import 'package:foot_fire/features/team_details/logic/cubit/all_players_cubit.dart';
import 'package:get_it/get_it.dart';

final getIt = GetIt.instance;

Future<void> setupGetIt() async {
//Api Service

  getIt.registerLazySingleton<ApiServices>(
    () => ApiServices(createAndSetUpDio()),
  );

  //local database
  getIt.registerFactory<DataBaseHelper>(
    () => DataBaseHelper(),
  );

//home

  getIt.registerLazySingleton<HomeRepo>(() => HomeRepo(getIt()));

  getIt.registerFactory<CountryCubit>(() => CountryCubit(getIt()));
  getIt.registerFactory<LeagueCubit>(() => LeagueCubit(getIt()));

  //league table

  getIt.registerLazySingleton<TableRepo>(() => TableRepo(getIt()));

  getIt.registerFactory<TableCubit>(() => TableCubit(getIt()));

  //league Events(matches)

  getIt.registerLazySingleton<MatchRepo>(() => MatchRepo(getIt()));

  getIt.registerFactory<MatchCubit>(() => MatchCubit(getIt()));

//league teams

  getIt.registerLazySingleton<TeamRepo>(() => TeamRepo(getIt()));

  getIt.registerFactory<TeamCubit>(() => TeamCubit(getIt()));

//search

  getIt.registerLazySingleton<SearchRepo>(() => SearchRepo(getIt()));

  getIt.registerFactory<SearchCubit>(() => SearchCubit(getIt()));

//player profile

  getIt.registerLazySingleton<PlayerRepo>(() => PlayerRepo(getIt()));

  getIt.registerFactory<PlayerCubit>(() => PlayerCubit(getIt()));

//all players for team

  getIt.registerLazySingleton<AllPlayersRepo>(
      () => AllPlayersRepo(apiServices: getIt()));

  getIt.registerFactory<AllPlayersCubit>(() => AllPlayersCubit(getIt()));

  //favorites

  getIt.registerLazySingleton<FavoritesRepo>(() => FavoritesRepo(getIt()));
  getIt.registerFactory<FavoritesCubit>(() => FavoritesCubit(getIt()));
}

Dio createAndSetUpDio() {
  Dio dio = Dio();
  dio
    ..options.connectTimeout = const Duration(seconds: 30)
    ..options.receiveTimeout = const Duration(seconds: 30);

  dio.interceptors.add(LogInterceptor(
    error: true,
    requestBody: true,
    request: true,
    responseBody: true,
    requestHeader: false,
    responseHeader: false,
  ));
  return dio;
}
