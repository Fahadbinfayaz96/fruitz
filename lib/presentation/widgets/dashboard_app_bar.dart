import 'package:flutter/material.dart';
import 'package:fruitz/constants/colors.dart';
import 'package:fruitz/constants/images.dart';

class DashboardAppbar extends StatelessWidget {
  const DashboardAppbar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      backgroundColor: AppColors.backgroundColor,
      bottom: PreferredSize(
        preferredSize: const Size(0, 20),
        child: Container(),
      ),
      pinned: false,
      centerTitle: true,
      expandedHeight: MediaQuery.of(context).size.height * 0.3,
      flexibleSpace: Stack(
        children: [
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            bottom: 0,
            child: Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                  colorFilter: ColorFilter.mode(
                    AppColors.backgroundColor.withOpacity(0.1),
                    BlendMode.darken,
                  ),
                  image: const AssetImage(
                    AppImages.logo,
                  ),
                  fit: BoxFit.cover,
                ),
              ),
              child: Container(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [
                      AppColors.backgroundColor.withOpacity(0.1),
                      AppColors.backgroundColor.withOpacity(0.1),
                    ],
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                  ),
                ),
              ),
            ),
          ),
          Positioned(
            bottom: -1,
            left: 0,
            right: 0,
            child: Container(
              height: 30,
              decoration: const BoxDecoration(
                color: AppColors.backgroundColor,
                borderRadius: BorderRadius.vertical(
                  top: Radius.circular(25),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
