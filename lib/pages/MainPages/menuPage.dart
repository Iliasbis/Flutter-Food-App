// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:food_app/util/FoodGrid.dart';
import 'package:food_app/util/bigText.dart';
import 'package:food_app/util/colors.dart';
import 'package:food_app/util/dimensions.dart';
import 'package:food_app/util/foodCard.dart';
import 'package:food_app/util/signinButton.dart';
import 'package:food_app/util/smallText.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:like_button/like_button.dart';

class menuPage extends StatefulWidget {
  const menuPage({super.key});

  @override
  State<menuPage> createState() => _menuPageState();
}

class _menuPageState extends State<menuPage> {
  List tabs = [
    [
      [
        "lib/foods/food1.png",
        "lib/foods/food2.png",
        "lib/foods/food3.png",
        "lib/foods/food4.png",
        "lib/foods/food5.png",
        "lib/foods/food6.png",
        "lib/foods/food7.png",
        "lib/foods/food8.png",
        "lib/foods/food9.png",
        "lib/foods/food10.png",
        "lib/foods/food11.png",
        "lib/foods/food12.png",
        "lib/foods/food13.png",
        "lib/foods/food14.png",
        "lib/foods/food15.png",
        "lib/foods/food16.png",
        "lib/foods/food17.png",
        "lib/foods/food18.png",
        "lib/foods/food19.png",
        "lib/foods/food20.png",
      ],
      [
        "Salade",
        "Rawz haha",
        "Chwa",
        "Chwa",
        "Tacos",
        "Pizza",
        "Burger",
        "Salade",
        "Rawz haha",
        "Chwa",
        "Chwa",
        "Tacos",
        "Pizza",
        "Burger",
        "Salade",
        "Rawz haha",
        "Chwa",
        "Chwa",
        "Tacos",
        "Pizza",
      ],
      [
        "\$14.88",
        "\$26.93",
        "\$32.14",
        "\$33.88",
        "\$26.18",
        "\$20.32",
        "\$21.88",
        "\$14.88",
        "\$26.93",
        "\$32.14",
        "\$33.88",
        "\$26.18",
        "\$20.32",
        "\$21.88",
        "\$14.88",
        "\$26.93",
        "\$32.14",
        "\$33.88",
        "\$26.18",
        "\$20.32",
      ]
    ],
    [
      [
        "lib/foods/food1.png",
        "lib/foods/food2.png",
        "lib/foods/food3.png",
        "lib/foods/food4.png",
        "lib/foods/food5.png",
        "lib/foods/food6.png",
        "lib/foods/food7.png",
      ],
      [
        "Salade",
        "Rawz haha",
        "Chwa",
        "Chwa",
        "Tacos",
        "Pizza",
        "Burger",
      ],
      [
        "\$14.88",
        "\$26.93",
        "\$32.14",
        "\$33.88",
        "\$26.18",
        "\$20.32",
        "\$21.88",
      ]
    ],
    [
      [
        "lib/foods/food7.png",
        "lib/foods/food3.png",
        "lib/foods/food12.png",
        "lib/foods/food5.png",
        "lib/foods/food20.png",
        "lib/foods/food18.png",
        "lib/foods/food16.png",
      ],
      [
        "Salade",
        "Beef",
        "Salade Fruit",
        "Tacos",
        "Salade",
        "Rawz",
        "Nudles",
      ],
      [
        "\$14.88",
        "\$26.93",
        "\$32.14",
        "\$33.88",
        "\$26.18",
        "\$20.32",
        "\$21.88",
      ]
    ],
    [
      [
        "lib/foods/food1.png",
        "lib/foods/food12.png",
        "lib/foods/food13.png",
        "lib/foods/food14.png",
        "lib/foods/food20.png",
        "lib/foods/food18.png",
        "lib/foods/food16.png",
      ],
      [
        "Salade",
        "Salade Friuts",
        "Pates",
        "Indomie",
        "Salade",
        "Rawz",
        "Nudles",
      ],
      [
        "\$14.88",
        "\$26.93",
        "\$32.14",
        "\$33.88",
        "\$26.18",
        "\$20.32",
        "\$21.88",
      ]
    ],
    [
      [
        "lib/foods/food5.png",
        "lib/foods/food10.png",
        "lib/foods/food15.png",
        "lib/foods/food8.png",
        "lib/foods/food7.png",
        "lib/foods/food9.png",
        "lib/foods/food11.png",
      ],
      [
        "Tacos",
        "Tacos haha",
        "Chawarma",
        "Nuget",
        "Burger",
        "Frite",
        "Mix",
      ],
      [
        "\$14.88",
        "\$26.93",
        "\$32.14",
        "\$33.88",
        "\$26.18",
        "\$20.32",
        "\$21.88",
      ]
    ],
  ];
  bool isCheck = true;

  void checkBoxClicked(value) {
    setState(() {
      isCheck = !isCheck;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: DefaultTabController(
        length: tabs.length,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: dimensions.height20),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: dimensions.width15),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SizedBox(height: dimensions.height10),
                      bigText(text: "Menu"),
                      Image.asset("lib/icons/notification.png")
                    ],
                  ),
                  SizedBox(height: dimensions.height15),
                  smallText(text: "Our Food"),
                  SizedBox(height: dimensions.height5),
                  Text(
                    "Special For You",
                    style: GoogleFonts.tajawal(
                      color: colors.PrimaryColor,
                      fontSize: dimensions.size13 * 2,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: dimensions.height15),
                  Container(
                    width: dimensions.screenWidth,
                    height: dimensions.height20 * 3.2,
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: colors.SmallText,
                      ),
                      color: colors.secondeButtonColor,
                      borderRadius: BorderRadius.circular(
                        dimensions.size13,
                      ),
                    ),
                    child: Padding(
                      padding: EdgeInsets.only(
                          left: dimensions.width13, top: dimensions.height5),
                      child: TextField(
                        // controller: _emailController,
                        style: TextStyle(fontSize: 18),
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          prefixIcon: Image.asset(
                            "lib/icons/search.png",
                            color: colors.SmallText,
                          ),
                          hintText: "Search your favorite food",
                          hintStyle: TextStyle(
                            fontSize: dimensions.size15 * 1.2,
                            fontWeight: FontWeight.w600,
                            color: colors.SmallText,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: dimensions.height15),
            TabBar(
              indicatorSize: TabBarIndicatorSize.label,
              indicatorColor: colors.PrimaryColor,
              labelColor: Colors.black,
              indicatorWeight: 4,
              isScrollable: true,
              tabs: [
                Text(
                  "All",
                  style: GoogleFonts.tajawal(
                    color: colors.SmallText,
                    fontSize: dimensions.size20,
                  ),
                ),
                Text(
                  "Featured",
                  style: GoogleFonts.tajawal(
                    color: colors.SmallText,
                    fontSize: dimensions.size20,
                  ),
                ),
                Text(
                  "Top of Week",
                  style: GoogleFonts.tajawal(
                    color: colors.SmallText,
                    fontSize: dimensions.size20,
                  ),
                ),
                Text(
                  "Soup",
                  style: GoogleFonts.tajawal(
                    color: colors.SmallText,
                    fontSize: dimensions.size20,
                  ),
                ),
                Text(
                  "Tacos",
                  style: GoogleFonts.tajawal(
                    color: colors.SmallText,
                    fontSize: dimensions.size20,
                  ),
                ),
              ],
            ),
            SizedBox(height: dimensions.height10),
            Expanded(
              child: Padding(
                padding: EdgeInsets.symmetric(
                    horizontal: dimensions.width15,
                    vertical: dimensions.height10),
                child: SizedBox(
                  width: dimensions.screenWidth,
                  child: TabBarView(
                    children: [
                      FoodGrid(
                          foodImage: tabs[0][0],
                          foodName: tabs[0][1],
                          foodPrice: tabs[0][2],
                          gridLenght: tabs[0][0]),
                      FoodGrid(
                          foodImage: tabs[1][0],
                          foodName: tabs[1][1],
                          foodPrice: tabs[1][2],
                          gridLenght: tabs[1][0]),
                      FoodGrid(
                          foodImage: tabs[2][0],
                          foodName: tabs[2][1],
                          foodPrice: tabs[2][2],
                          gridLenght: tabs[2][0]),
                      FoodGrid(
                          foodImage: tabs[3][0],
                          foodName: tabs[3][1],
                          foodPrice: tabs[3][2],
                          gridLenght: tabs[3][0]),
                      FoodGrid(
                          foodImage: tabs[4][0],
                          foodName: tabs[4][1],
                          foodPrice: tabs[4][2],
                          gridLenght: tabs[4][0]),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
