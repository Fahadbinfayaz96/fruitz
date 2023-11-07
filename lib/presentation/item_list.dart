import 'dart:developer';

import 'package:flutter/material.dart';

import '../constants/colors.dart';
import '../utils/my_icons.dart';

class ItemListScreen extends StatelessWidget {
  const ItemListScreen({super.key, required this.id, required this.index});
  final int id;
  final int index;
  List<ItemData> getItemsToDisplay() {
    if (id == 1) {
      return itemDataList["1"] ?? [];
    } else if (id == 2) {
      return itemDataList["2"] ?? [];
    } else if (id == 3) {
      return itemDataList["3"] ?? [];
    } else if (id == 4) {
      return itemDataList["4"] ?? [];
    } else if (id == 5) {
      return itemDataList["5"] ?? [];
    } else if (id == 6) {
      return itemDataList["6"] ?? [];
    } else if (id == 7) {
      return itemDataList["7"] ?? [];
    } else if (id == 8) {
      return itemDataList["8"] ?? [];
    } else if (id == 9) {
      return itemDataList["9"] ?? [];
    } else if (id == 10) {
      return itemDataList["10"] ?? [];
    } else if (id == 11) {
      return itemDataList["11"] ?? [];
    } else if (id == 12) {
      return itemDataList["12"] ?? [];
    } else if (id == 13) {
      return itemDataList["13"] ?? [];
    } else {
      return itemDataList.values.expand((list) => list).toList();
    }
  }

  @override
  Widget build(BuildContext context) {
    final itemsToDisplay = getItemsToDisplay();
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      appBar: AppBar(
        backgroundColor: AppColors.backgroundColor,
        title: Text(heading[index].toString()),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: itemsToDisplay.length,
              itemBuilder: (context, index) {
                log("item length ${itemsToDisplay.length}");
                return Container(
                  height: 100,
                  margin: const EdgeInsets.all(10),
                  padding: const EdgeInsets.all(12),
                  decoration: BoxDecoration(
                      color: AppColors.backgroundColor,
                      borderRadius: BorderRadius.circular(20),
                      boxShadow: const [
                        BoxShadow(color: AppColors.primaryColor, blurRadius: 1)
                      ]),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              Text(itemsToDisplay[index].name,
                                  style: const TextStyle(
                                      fontSize: 16,
                                      color: AppColors.textColorWhite)),
                              const SizedBox(
                                width: 15,
                              ),
                              Icon(
                                MyIcons.veg,
                                color: itemsToDisplay[index].color,
                                size: 20,
                              ),
                            ],
                          ),
                          Text(
                            "\u{20B9} ${itemsToDisplay[index].price}",
                            style: const TextStyle(
                                fontSize: 18, color: AppColors.textColorWhite),
                            textAlign: TextAlign.center,
                          )
                        ],
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Text(itemsToDisplay[index].special.toString(),
                          style: const TextStyle(fontSize: 16)),
                    ],
                  ),
                );
              },
            ),
          ),
          const Padding(
            padding: EdgeInsets.all(8.0),
            child: Text(
              "All the prices are including GST ",
              style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w500,
                  color: AppColors.primaryColor),
              textAlign: TextAlign.center,
            ),
          ),
        ],
      ),
    );
  }
}

class ItemData {
  final String name;
  final String price;

  final String? special;
  final Color color;
  ItemData({
    required this.name,
    required this.price,
    this.special,
    required this.color,
  });
}

final heading = [
  "Salad",
  "Mocktails",
  "Baskets",
];
final itemDataList = {
  "1": [
    ItemData(
        name: "Fruit salad classic",
        price: "70",
        color: AppColors.darkGreen,
        special: ""),
    ItemData(
        name: "Fruit salad delight",
        price: "100",
        color: AppColors.darkGreen,
        special: ""),
    ItemData(
        name: "Fruit salad classic with dry fruits",
        price: "100",
        color: AppColors.darkGreen,
        special: ""),
    ItemData(
        name: "Fruit salad classic with dry fruits",
        price: "130",
        color: AppColors.darkGreen,
        special: ""),
    ItemData(
        name: "Fruit salad classic with dates",
        price: "130",
        color: AppColors.darkGreen,
        special: ""),
    ItemData(
        name: "Fruit salad classic with ice cream",
        price: "130",
        color: AppColors.darkGreen,
        special: ""),
    ItemData(
        name: "Fruit salad classic with cream",
        price: "120",
        color: AppColors.darkGreen,
        special: ""),
  ],
  "2": [
    ItemData(
        name: "Virgin lime mojito",
        price: "100",
        color: AppColors.darkGreen,
        special: ""),
    ItemData(
        name: "Strawberry mojito",
        price: "100",
        color: AppColors.darkGreen,
        special: ""),
    ItemData(
        name: "Blue coroaco",
        price: "100",
        color: AppColors.darkGreen,
        special: ""),
    ItemData(
        name: "Green apple",
        price: "100",
        color: AppColors.darkGreen,
        special: ""),
  ],
  "3": [
    ItemData(
        name: "Small basket",
        price: "500",
        color: AppColors.darkGreen,
        special: ""),
    ItemData(
        name: "Medium basket",
        price: "700",
        color: AppColors.darkGreen,
        special: ""),
    ItemData(
        name: "Large basket",
        price: "1000",
        color: AppColors.darkGreen,
        special: ""),
  ],
};
