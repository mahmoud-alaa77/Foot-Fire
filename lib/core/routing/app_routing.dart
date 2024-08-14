
import 'package:flutter/material.dart';
import 'package:foot_fire/core/routing/routes.dart';
import 'package:foot_fire/features/home/ui/home_screen.dart';
import 'package:foot_fire/features/onboarding/ui/on_boarding_screen.dart';
import 'package:foot_fire/features/splash/ui/splash_screen.dart';

class AppRouting {

  Route? genrateRoute(RouteSettings settings) {    switch(settings.name){
case Routes.splashScreen:
      return MaterialPageRoute(builder: (context) => const SplashScreen());

      case Routes.onBoarding:
      return MaterialPageRoute(builder: (context) => const OnboardingScreen());
       case Routes.home:
      return MaterialPageRoute(builder: (context) => const HomeScreen());
    }
    return null;
  }
}