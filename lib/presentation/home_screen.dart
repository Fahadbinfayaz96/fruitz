import 'package:double_back_to_close/double_back_to_close.dart';
import 'package:flutter/material.dart';
import 'package:fruitz/presentation/widgets/dashboard_app_bar.dart';
import 'package:google_fonts/google_fonts.dart';

import '../constants/app_strings.dart';
import '../constants/colors.dart';
import '../utils/screen_sizes.dart';
import 'item_list.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      body: DoubleBack(
        message: AppStrings.backMessage,
        waitForSecondBackPress: AppStrings.backTime,
        child: CustomScrollView(
          physics: const BouncingScrollPhysics(),
          scrollBehavior: const MaterialScrollBehavior().copyWith(
            scrollbars: false,
          ),
          slivers: [
            const DashboardAppbar(),
            SliverPadding(
              padding: const EdgeInsets.only(bottom: 40, left: 20, right: 20),
              sliver: SliverList(
                delegate: SliverChildBuilderDelegate(
                  (BuildContext context, int index) {
                    return ItemBlock(
                      index: index,
                    );
                  },
                  // 40 list items
                  childCount: 3,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class ItemBlock extends StatelessWidget {
  final int index;
  const ItemBlock({
    super.key,
    required this.index,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => ItemListScreen(
                id: yourDataList[index].id,
                index: index,
              ),
            ));
      },
      child: Container(
        width: double.infinity,
        margin: const EdgeInsets.symmetric(vertical: 10),
        decoration: BoxDecoration(
            color: AppColors.backgroundColor,
            borderRadius: BorderRadius.circular(10),
            boxShadow: const [
              BoxShadow(
                  spreadRadius: 0, blurRadius: 1, color: AppColors.primaryColor)
            ]),
        child: Stack(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: ColorFiltered(
                colorFilter: ColorFilter.mode(
                  AppColors.backgroundColor.withOpacity(0.6),
                  BlendMode.darken,
                ),
                child: Image.asset(
                  yourDataList[index].imageUrl,
                  height: 160,
                  width: ScreenSizes.isSmallScreen(context) ? 400 : 700,
                  fit: BoxFit.fitWidth,
                ),
              ),
            ),
            Positioned(
              left: 20,
              top: 20,
              child: Text(
                yourDataList[index].text,
                style: GoogleFonts.handlee(
                  fontSize: ScreenSizes.isMeduimScreen(context) ? 35 : 30,
                  color: AppColors.textColorWhite,
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.center,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class YourData {
  final String text;
  final String imageUrl;
  final int id;

  YourData({
    required this.text,
    required this.imageUrl,
    required this.id,
  });
}

List<YourData> yourDataList = [
  YourData(
    text: "Salads",
    imageUrl: "assets/images/menu/fruit_salad.png",
    id: 1,
  ),
  YourData(
    text: "Mocktails",
    imageUrl: "assets/images/menu/mocktails.png",
    id: 2,
  ),
  YourData(
    text: "Baskets",
    imageUrl: "assets/images/menu/fruit_basket.png",
    id: 3,
  ),
];
