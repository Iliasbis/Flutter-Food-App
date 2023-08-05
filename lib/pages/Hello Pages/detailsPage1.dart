// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:food_app/pages/Authentification/signinPage.dart';
import 'package:food_app/pages/Authentification/signupPage.dart';
import 'package:food_app/pages/Hello%20Pages/helloPage1.dart';
import 'package:food_app/pages/Hello%20Pages/helloPage2.dart';
import 'package:food_app/util/bigText.dart';
import 'package:food_app/util/colors.dart';
import 'package:food_app/util/dimensions.dart';
import 'package:food_app/util/signinButton.dart';
import 'package:food_app/util/smallText.dart';
import 'package:get/get_state_manager/src/simple/list_notifier.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class detailsPage1 extends StatefulWidget {
  const detailsPage1({super.key});
  @override
  State<detailsPage1> createState() => _detailsPage1State();
}

class _detailsPage1State extends State<detailsPage1> {
  var _controller = PageController();
  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  List<Widget> pages = [
    helloPage1(),
    helloPage2(),
  ];
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              flex: 3,
              child: SizedBox(
                  width: dimensions.screenWidth,
                  height: dimensions.height100 * 4,
                  child: PageView.builder(
                    itemCount: pages.length,
                    onPageChanged: (value) {
                      setState(() {
                        _selectedIndex = value;
                      });
                    },
                    controller: _controller,
                    itemBuilder: (context, index) {
                      return pages[_selectedIndex];
                    },
                  )),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SmoothPageIndicator(
                  controller: _controller,
                  effect: ScrollingDotsEffect(
                    activeDotColor: colors.PrimaryColor,
                    dotHeight: 12,
                    dotWidth: 12,
                  ),
                  count: pages.length,
                ),
              ],
            ),
            SizedBox(height: dimensions.height20),
            Expanded(
              flex: 1,
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: dimensions.width15),
                child: Column(
                  children: [
                    GestureDetector(
                      onTap: () {
                        if (_selectedIndex == 0) {
                          setState(() {
                            _controller.nextPage(
                              duration: Duration(milliseconds: 400),
                              curve: Curves.easeIn,
                            );
                          });
                        } else {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) {
                                return signupPage();
                              },
                            ),
                          );
                        }
                      },
                      child: signinButton(
                        backgroundColor: colors.PrimaryColor,
                        textColor: Colors.white,
                        text: _selectedIndex == 0 ? "Continue" : "Get Started",
                      ),
                    ),
                    SizedBox(height: dimensions.height10),
                    GestureDetector(
                      onTap: () {
                        Navigator.push(context, MaterialPageRoute(
                          builder: (context) {
                            return checkSignIn();
                          },
                        ));
                      },
                      child: signinButton(
                        backgroundColor: colors.secondeButtonColor,
                        textColor: colors.PrimaryColor,
                        text: "Sign in",
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
