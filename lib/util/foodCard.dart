import 'package:flutter/material.dart';
import 'package:food_app/util/colors.dart';
import 'package:food_app/util/dimensions.dart';
import 'package:google_fonts/google_fonts.dart';

class foodCard extends StatelessWidget {
  final String foodImage;
  final String foodName;
  final String foodPrice;

  const foodCard({
    required this.foodImage,
    required this.foodName,
    required this.foodPrice,
    super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                color: colors.ImageBackgroundColor1,
                image: DecorationImage(
                  fit: BoxFit.contain,
                  image: AssetImage(
                    foodImage,
                  ),
                ),
                borderRadius: BorderRadius.circular(dimensions.size15),
              ),
              width: dimensions.width100 * 2,
              height: 250,
            ),
          ),
          SizedBox(height: dimensions.height5),
          Text(
            foodName,
            style: GoogleFonts.tajawal(
              color: colors.BigTextColor,
              fontSize: dimensions.size20,
              fontWeight: FontWeight.w700,
            ),
          ),
          Text(
            foodPrice,
            style: GoogleFonts.tajawal(
              color: colors.PrimaryColor,
              fontSize: dimensions.size20,
              fontWeight: FontWeight.w700,
            ),
          ),
        ],
      ),
    );
  }
}
