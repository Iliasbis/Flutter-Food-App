import 'package:flutter/material.dart';
import 'package:food_app/util/colors.dart';
import 'package:food_app/util/dimensions.dart';
import 'package:google_fonts/google_fonts.dart';

class bigText extends StatelessWidget {
  final String text;
  final double? size;
  final Color? color;
  final FontWeight? font;
  const bigText({
    required this.text,
    this.font = FontWeight.bold,
    this.size,
    this.color,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: GoogleFonts.tajawal(
        fontSize: dimensions.size15 * 1.8,
        fontWeight: font,
        color: colors.BigTextColor,
      ),
    );
  }
}
