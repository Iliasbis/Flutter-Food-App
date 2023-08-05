import 'package:flutter/material.dart';
import 'package:food_app/util/bigText.dart';
import 'package:food_app/util/colors.dart';
import 'package:food_app/util/dimensions.dart';
import 'package:food_app/util/smallText.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';

class helloPage1 extends StatelessWidget {
  const helloPage1({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: dimensions.height10,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Lottie.asset(
              "lib/icons/salade.json",
              fit: BoxFit.cover,
              width: dimensions.width20 * 2,
              repeat: false,
            ),
            SizedBox(width: dimensions.width10),
            Padding(
              padding: EdgeInsets.only(top: dimensions.height20),
              child: bigText(text: "Foodie"),
            ),
          ],
        ),
        SizedBox(height: dimensions.height20 * 1.7),
        Container(
          padding: EdgeInsets.all(dimensions.size15),
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            border: Border.all(
              width: 2,
              color: Colors.grey.shade300,
            ),
          ),
          child: Container(
            padding: EdgeInsets.all(dimensions.size20 * 1.6),
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: Colors.grey.shade300,
            ),
            child: Image.asset(
              "lib/icons/salade.png",
              width: 200,
            ),
          ),
        ),
        SizedBox(height: dimensions.height22),
        Column(
          children: [
            Text(
              "All your",
              style: GoogleFonts.tajawal(
                fontSize: dimensions.size20 * 1.6,
                fontWeight: FontWeight.bold,
                color: colors.BigTextColor,
              ),
            ),
            Text(
              "favorites foods",
              style: GoogleFonts.tajawal(
                fontSize: dimensions.size20 * 1.6,
                fontWeight: FontWeight.bold,
                color: colors.BigTextColor,
              ),
            ),
            SizedBox(height: dimensions.height10),
            smallText(text: "Order your favorite menu with easy,"),
            smallText(text: "on-demand delivery"),
          ],
        ),
      ],
    );
  }
}
