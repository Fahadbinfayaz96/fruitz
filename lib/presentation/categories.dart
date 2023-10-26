import 'package:flutter/material.dart';
import 'package:fruitz/utils/screen_sizes.dart';
import '../utils/colors.dart';
import 'item_list.dart';

class CategoriesScreen extends StatelessWidget {
  const CategoriesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        // extendBodyBehindAppBar: true,
        appBar: AppBar(
          title: const Text("Furtiz"),
          centerTitle: true,
          backgroundColor: AppColors.bColor,
          elevation: 0,
          automaticallyImplyLeading: true,
          foregroundColor: AppColors.textColorWhite,
        ),
        backgroundColor: AppColors.bColor,
        body: Column(
          children: [
            Transform.translate(
              offset: const Offset(-30, 0),
              child: Image.asset(
                "assets/images/logo.png",
                fit: BoxFit.fill,
                width: double.infinity,
                height:ScreenSizes.isMeduimScreen(context)?300 :260,
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Expanded(
              child: ListView.builder(
               
                itemCount: yourDataList.length,
                itemBuilder: (context, index) {
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
                      margin: const EdgeInsets.only(
                          left: 15, right: 15, bottom: 15),
                      decoration: BoxDecoration(
                          color: AppColors.textColorWhite,
                          borderRadius: BorderRadius.circular(20),
                          boxShadow: const [
                            BoxShadow(
                                spreadRadius: 0,
                                blurRadius: 1,
                                color: AppColors.textColorWhite)
                          ]),
                      child: Stack(
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(20),
                            child: ColorFiltered(
                              colorFilter: ColorFilter.mode(
                                const Color.fromARGB(255, 189, 181, 181)
                                    .withOpacity(0.95),
                                BlendMode.modulate,
                              ),
                              child: Image.asset(
                                yourDataList[index].imageUrl,
                                height: 160,
                                width:ScreenSizes.isSmallScreen(context)? 400:700,
                                fit: BoxFit.fitWidth,
                              ),
                            ),
                          ),
                          Positioned(
                            left: 5,
                            top: 10,
                            child: Text(
                              yourDataList[index].text,
                              style:  TextStyle(
                                fontSize:ScreenSizes.isMeduimScreen(context)?19: 17,
                                color: AppColors.textColorWhite,
                              ),
                              textAlign: TextAlign.center,
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ));
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
    imageUrl: "assets/images/raita.png",
    id: 1,
  ),
  YourData(
    text: "Mocktails",
    imageUrl: "assets/images/drinks.png",
    id: 2,
  ),
  YourData(
    text: "Baskets",
    imageUrl: "assets/images/southindian.png",
    id: 3,
  ),
];
