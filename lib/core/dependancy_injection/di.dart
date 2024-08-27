import 'package:dio/dio.dart';
import 'package:foot_fire/core/networking/api_services.dart';
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
import 'package:get_it/get_it.dart';

final getIt = GetIt.instance;

Future<void> setupGetIt() async {
//Api Service

  getIt.registerLazySingleton<ApiServices>(
    () => ApiServices(createAndSetUpDio()),
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
