// ignore_for_file: prefer_const_constructors

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:food_app/util/bigText.dart';
import 'package:food_app/util/colors.dart';
import 'package:food_app/util/dimensions.dart';
import 'package:food_app/util/smallText.dart';
import 'package:google_fonts/google_fonts.dart';

class profilePage extends StatelessWidget {
  const profilePage({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            SizedBox(height: dimensions.height50),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  height: dimensions.height100 * 2,
                  width: dimensions.width100 * 2,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    image: DecorationImage(
                      alignment: Alignment.topCenter,
                      fit: BoxFit.cover,
                      image: AssetImage("lib/foods/profile.JPG"),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: dimensions.height15),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "ILias Bissoufa",
                  style: GoogleFonts.tajawal(
                    fontSize: dimensions.size20 * 1.4,
                    fontWeight: FontWeight.w700,
                    color: Colors.teal,
                  ),
                ),
              ],
            ),
            SizedBox(height: dimensions.height50),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: dimensions.width20),
              child: Column(
                children: [
                  Container(
                    width: dimensions.screenWidth,
                    height: dimensions.height50 * 1.2,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(
                        dimensions.size15,
                      ),
                      color: Colors.grey.shade300,
                    ),
                    child: Padding(
                      padding:
                          EdgeInsets.symmetric(horizontal: dimensions.width15),
                      child: Row(
                        children: [
                          SizedBox(width: dimensions.width10),
                          Text(
                            "ILias Bissoufa",
                            style: GoogleFonts.tajawal(
                              fontSize: dimensions.size20,
                              fontWeight: FontWeight.w700,
                              color: colors.SecondaryColor,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(height: dimensions.height15),
                  Container(
                    width: dimensions.screenWidth,
                    height: dimensions.height50 * 1.2,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(
                        dimensions.size15,
                      ),
                      color: Colors.grey.shade300,
                    ),
                    child: Padding(
                      padding:
                          EdgeInsets.symmetric(horizontal: dimensions.width15),
                      child: Row(
                        children: [
                          SizedBox(width: dimensions.width10),
                          Text(
                            FirebaseAuth.instance.currentUser!.email != null
                                ? FirebaseAuth.instance.currentUser!.email
                                    .toString()
                                : "No email",
                            style: GoogleFonts.tajawal(
                              fontSize: dimensions.size20,
                              fontWeight: FontWeight.w700,
                              color: colors.SecondaryColor,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(height: dimensions.height15),
                  Container(
                    width: dimensions.screenWidth,
                    height: dimensions.height50 * 1.2,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(
                        dimensions.size15,
                      ),
                      color: Colors.grey.shade300,
                    ),
                    child: Padding(
                      padding:
                          EdgeInsets.symmetric(horizontal: dimensions.width15),
                      child: Row(
                        children: [
                          SizedBox(width: dimensions.width10),
                          Text(
                            "06511****8",
                            style: GoogleFonts.tajawal(
                              fontSize: dimensions.size20,
                              fontWeight: FontWeight.w700,
                              color: colors.SecondaryColor,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: dimensions.height50),
            MaterialButton(
              color: Colors.teal,
              height: dimensions.height22 * 2,
              minWidth: dimensions.width100,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(dimensions.size15),
              ),
              padding: EdgeInsets.symmetric(
                horizontal: dimensions.width20,
                vertical: dimensions.height10,
              ),
              onPressed: () {
                FirebaseAuth.instance.signOut();
              },
              child: Text(
                "log out",
                style: GoogleFonts.tajawal(
                  fontSize: dimensions.size20,
                  fontWeight: FontWeight.w600,
                  color: Colors.white,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
