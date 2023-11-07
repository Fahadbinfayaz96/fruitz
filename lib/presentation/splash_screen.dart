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

    getJwtToken();
  }

  void getJwtToken() async {
    Duration delay = const Duration(seconds: 2);
    await Future.delayed(
      delay,
      () {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => const HomeScreen(),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedSplashScreen(
      splash: AppImages.logo,
      splashIconSize: 300,
      animationDuration: const Duration(seconds: 2),
      nextScreen: const HomeScreen(),
      backgroundColor: AppColors.backgroundColor,
      splashTransition: SplashTransition.fadeTransition,
      pageTransitionType: PageTransitionType.scale,
    );
    ;
  }
}
