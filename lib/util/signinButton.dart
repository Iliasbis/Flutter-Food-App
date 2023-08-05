// ignore_for_file: prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:food_app/util/bigText.dart';
import 'package:food_app/util/colors.dart';
import 'package:food_app/util/dimensions.dart';
import 'package:google_fonts/google_fonts.dart';

class signinButton extends StatelessWidget {
  final Color backgroundColor;
  final String text;
  final Color textColor;
  final FontWeight font;
  final bool border;
  const signinButton(
      {super.key,
      this.font = FontWeight.bold,
      required this.backgroundColor,
      this.border = false,
      required this.textColor,
      required this.text});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: dimensions.screenWidth,
      height: dimensions.height20 * 3.4,
      decoration: BoxDecoration(
        border: border
            ? Border.all(color: colors.SmallText, width: 1.2)
            : Border.all(width: 0, color: Colors.transparent),
        borderRadius: BorderRadius.circular(dimensions.size15),
        color: backgroundColor,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            text,
            style: GoogleFonts.tajawal(
              fontSize: dimensions.size24,
              fontWeight: font,
              color: textColor,
            ),
          )
        ],
      ),
    );
  }
}
