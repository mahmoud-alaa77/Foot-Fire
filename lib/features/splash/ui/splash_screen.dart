import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:foot_fire/core/routing/routes.dart';
import 'package:foot_fire/core/theming/app_colors.dart';
import 'package:foot_fire/features/home/ui/home_screen.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: AnimatedSplashScreen(
        splash: Image.asset("assets/images/logo.png"),
        splashIconSize: 280,
        backgroundColor: AppColors.darkGrayColor,
        nextRoute: Routes.home,
        disableNavigation: false,
        duration: 400,
        animationDuration: const Duration(seconds: 1),
        splashTransition: SplashTransition.scaleTransition,
        nextScreen: const HomeScreen(),
      ),
    );
  }
}
