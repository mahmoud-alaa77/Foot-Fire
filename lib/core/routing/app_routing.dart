import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:foot_fire/core/dependancy_injection/di.dart';
import 'package:foot_fire/core/routing/routes.dart';
import 'package:foot_fire/features/home/logic/cubit/country_cubit.dart';
import 'package:foot_fire/features/home/logic/cubit/league_cubit.dart';
import 'package:foot_fire/features/home/ui/home_screen.dart';
import 'package:foot_fire/features/splash/ui/splash_screen.dart';

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
                  ],
                  child: const HomeScreen(),
                ));
      default:
        return null;
    }
  }
}
