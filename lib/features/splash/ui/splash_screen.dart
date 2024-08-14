
import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:foot_fire/features/onboarding/ui/on_boarding_screen.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return AnimatedSplashScreen(
      splash: Image.asset("assets/images/football.png"),
      splashIconSize:280  ,
      backgroundColor: Colors.black26,
      //nextRoute: Routes.onBoarding,
      disableNavigation: false,
      duration: 400,
      animationDuration: const Duration(seconds: 1),
      //pageTransitionType: PageTransitionType.bottomToTop,
      splashTransition: SplashTransition.scaleTransition,
       nextScreen: const OnboardingScreen(),

    );
  }
}