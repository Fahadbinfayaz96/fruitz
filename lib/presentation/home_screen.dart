import 'package:flutter/material.dart';
import 'package:fruitz/utils/screen_sizes.dart';

import '../utils/colors.dart';
import 'categories.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: AppColors.bColor,
        body: Center(
          child: Transform.translate(
            offset: const Offset(-26, 0),
            child: Image.asset(
              "assets/images/logo.png",
            ),
          ),
        ),
        floatingActionButton: Align(
          alignment:ScreenSizes.isMeduimScreen(context)? Alignment.bottomCenter:Alignment.bottomRight,
          child: ElevatedButton(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const CategoriesScreen(),
                    ));
              },
              style: ElevatedButton.styleFrom(
                fixedSize:  Size(ScreenSizes.isMeduimScreen(context)? 600:380, 40),
                backgroundColor: AppColors.redColor,
              ),
              child: const Text(
                "Continue",
                textAlign: TextAlign.center,
              )),
        ));
  }
}
