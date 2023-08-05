// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:food_app/util/bigText.dart';
import 'package:food_app/util/colors.dart';
import 'package:food_app/util/dimensions.dart';
import 'package:food_app/util/smallText.dart';
import 'package:google_fonts/google_fonts.dart';

class homePage extends StatelessWidget {
  homePage({super.key});
  void logOut() {
    FirebaseAuth.instance.signOut();
  }

  String myLocation = "Casablanca, Morocco";
  double distance = 2.4;
  final TextStyle textCardStyle = GoogleFonts.tajawal(
    fontSize: dimensions.size20,
    fontWeight: FontWeight.w500,
    color: colors.secondTextColor,
  );

  List<String> images = [
    "lib/foods/food1.png",
    "lib/foods/food2.png",
    "lib/foods/food3.png",
    "lib/foods/food4.png",
    "lib/foods/food5.png",
    "lib/foods/food6.png",
    "lib/foods/food7.png",
  ];
  List<String> foodName = [
    "Salade",
    "Rawz haha",
    "Chwa",
    "Chwa",
    "Tacos",
    "Pizza",
    "Burger",
  ];
  List<String> foodPrice = [
    "\$14.88",
    "\$26.93",
    "\$32.14",
    "\$33.88",
    "\$26.18",
    "\$20.32",
    "\$21.88",
  ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: dimensions.height20),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: dimensions.width15),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SizedBox(height: dimensions.height10),
                      bigText(text: "Home"),
                      Image.asset(
                        "lib/icons/notification.png",
                      )
                    ],
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
                        // controller: _searchController,
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
                  SizedBox(height: dimensions.height22),
                  Container(
                    width: dimensions.screenWidth,
                    height: dimensions.height100 * 1.4,
                    decoration: BoxDecoration(
                        color: colors.PrimaryColor,
                        borderRadius: BorderRadius.circular(
                          dimensions.size15,
                        ),
                        boxShadow: [
                          BoxShadow(
                            spreadRadius: -15,
                            color: colors.shadowColor,
                            offset: Offset(0, 25),
                            blurRadius: 0,
                          ),
                        ]),
                    child: Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: dimensions.width20,
                        vertical: dimensions.height10,
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "Dilevery to Home",
                                style: textCardStyle,
                              ),
                              Icon(
                                Icons.arrow_forward_ios,
                                color: colors.secondTextColor,
                                size: dimensions.size20 * 1.5,
                              ),
                            ],
                          ),
                          Text(
                            myLocation,
                            style: TextStyle(
                              color: colors.secondTextColor,
                              fontWeight: FontWeight.w400,
                              fontSize: dimensions.size20,
                            ),
                          ),
                          Container(
                            padding: EdgeInsets.symmetric(
                              horizontal: dimensions.width20,
                              vertical: dimensions.height5,
                            ),
                            decoration: BoxDecoration(
                              borderRadius:
                                  BorderRadius.circular(dimensions.size10),
                              color: colors.secondTextColor,
                            ),
                            child: Text(
                              distance.toString() + " Km",
                              style: TextStyle(
                                color: colors.PrimaryColor,
                                fontWeight: FontWeight.w500,
                                fontSize: dimensions.size20,
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                  SizedBox(height: dimensions.height20 * 2),
                  Container(
                    width: dimensions.screenWidth,
                    height: dimensions.height120 * 1.4,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(dimensions.size15),
                      color: colors.ImageBackgroundColor1,
                    ),
                    child: Padding(
                      padding: EdgeInsets.only(
                        left: dimensions.width10,
                        top: dimensions.height15,
                        bottom: dimensions.height15,
                      ),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              bigText(
                                text: "Chicken Teriyaki",
                                font: FontWeight.bold,
                              ),
                              smallText(text: "Discount 25%"),
                              Container(
                                decoration: BoxDecoration(
                                  borderRadius:
                                      BorderRadius.circular(dimensions.size13),
                                  color: colors.PrimaryColor,
                                ),
                                padding: EdgeInsets.symmetric(
                                  horizontal: dimensions.width13 * 2,
                                  vertical: dimensions.height15,
                                ),
                                child: Text(
                                  "Order Now",
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.w500,
                                    fontSize: dimensions.size20,
                                  ),
                                ),
                              ),
                            ],
                          ),
                          Image.asset(
                            "lib/foods/food1.png",
                            fit: BoxFit.cover,
                            width: dimensions.width100 * 1.2,
                          )
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: dimensions.height22),
            Padding(
              padding: EdgeInsets.only(left: dimensions.width15),
              child: bigText(text: "Top of Week"),
            ),
            SizedBox(height: dimensions.height5),
            SizedBox(
              height: dimensions.height100 * 2.2,
              width: dimensions.screenWidth,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: images.length,
                itemBuilder: (BuildContext context, int index) {
                  return Padding(
                    padding: EdgeInsets.only(
                      left: dimensions.width13,
                      right: dimensions.width5,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          height: dimensions.height100 * 1.5,
                          width: dimensions.width100 * 1.5,
                          decoration: BoxDecoration(
                            borderRadius:
                                BorderRadius.circular(dimensions.size10),
                            color: colors.ImageBackgroundColor1,
                            image: DecorationImage(
                              image: AssetImage(images[index]),
                              fit: BoxFit.contain,
                            ),
                          ),
                        ),
                        SizedBox(height: dimensions.height10),
                        Text(
                          foodName[index],
                          style: GoogleFonts.tajawal(
                            fontSize: dimensions.size20,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                        SizedBox(height: dimensions.height5),
                        Text(
                          foodPrice[index],
                          style: GoogleFonts.tajawal(
                            color: colors.PrimaryColor,
                            fontSize: dimensions.size20,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
