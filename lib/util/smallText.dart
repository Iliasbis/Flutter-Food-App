import 'package:flutter/material.dart';
import 'package:food_app/util/colors.dart';
import 'package:food_app/util/dimensions.dart';
import 'package:google_fonts/google_fonts.dart';

class smallText extends StatelessWidget {
  final String text;
  final double? size;
  final Color? color;
  final FontWeight? font;
  const smallText({
    required this.text,
    this.font = FontWeight.w500,
    this.size,
    this.color,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      textAlign: TextAlign.center,
      style: GoogleFonts.tajawal(
        fontSize: dimensions.size15 * 1.2,
        fontWeight: font,
        color: colors.SmallText,
      ),
    );
  }
}
