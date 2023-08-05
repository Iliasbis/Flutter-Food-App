// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:food_app/pages/Authentification/signinPage.dart';
import 'package:food_app/util/bigText.dart';
import 'package:food_app/util/colors.dart';
import 'package:food_app/util/dimensions.dart';
import 'package:food_app/util/signinButton.dart';
import 'package:food_app/util/smallText.dart';
import 'package:lottie/lottie.dart';

class congratulationPage extends StatelessWidget {
  const congratulationPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: dimensions.width15),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Lottie.asset(
                "lib/icons/check.json",
                width: dimensions.width100,
                height: dimensions.height100,
              ),
              bigText(text: "Congratulation!"),
              SizedBox(height: dimensions.height20),
              smallText(
                text:
                    "Your account is restorted succesfully, check your reset message in your email",
              ),
              SizedBox(height: dimensions.height20 * 2),
              GestureDetector(
                onTap: () {
                  Navigator.pushReplacement(context, MaterialPageRoute(
                    builder: (context) {
                      return signinPage();
                    },
                  ));
                },
                child: signinButton(
                    backgroundColor: colors.PrimaryColor,
                    textColor: Colors.white,
                    text: "Get Started"),
              )
            ],
          ),
        ),
      ),
    );
  }
}
