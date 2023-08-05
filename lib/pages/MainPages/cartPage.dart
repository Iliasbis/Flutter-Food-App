import 'package:flutter/material.dart';
import 'package:food_app/util/bigText.dart';
import 'package:food_app/util/colors.dart';
import 'package:food_app/util/dimensions.dart';
import 'package:google_fonts/google_fonts.dart';

class cartPage extends StatelessWidget {
  final TextStyle textCardStyle = GoogleFonts.tajawal(
    fontSize: dimensions.size20,
    fontWeight: FontWeight.w500,
    color: colors.secondTextColor,
  );
  String myLocation = "Casablanca, Morocco";

  cartPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
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
                    bigText(text: "My Cart"),
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
                            "2.4 Km",
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
              ],
            ),
          ),
        ],
      ),
    );
  }
}
