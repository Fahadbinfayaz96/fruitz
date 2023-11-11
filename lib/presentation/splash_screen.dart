import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:fruitz/constants/colors.dart';
import 'package:fruitz/constants/images.dart';
import 'package:page_transition/page_transition.dart';

import 'home_screen.dart';

class SplashScreen extends StatefulWidget {
  SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedSplashScreen(
      splash: AppImages.logo,
      splashIconSize: 300,
      animationDuration: const Duration(seconds: 2),
      nextScreen: const HomeScreen(),
      duration: 2000,
      backgroundColor: AppColors.backgroundColor,
      splashTransition: SplashTransition.fadeTransition,
      pageTransitionType: PageTransitionType.rightToLeft,
    );
    ;
  }
}
