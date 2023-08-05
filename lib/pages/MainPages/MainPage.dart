// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:food_app/pages/MainPages/cartPage.dart';
import 'package:food_app/pages/MainPages/homePage.dart';
import 'package:food_app/pages/MainPages/menuPage.dart';
import 'package:food_app/pages/MainPages/profilePage.dart';
import 'package:food_app/util/colors.dart';
import 'package:food_app/util/dimensions.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

class mainPage extends StatefulWidget {
  const mainPage({super.key});

  @override
  State<mainPage> createState() => _mainPageState();
}

class _mainPageState extends State<mainPage> {
  List<Widget> pages = [
    homePage(),
    menuPage(),
    cartPage(),
    profilePage(),
  ];
  int _selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: Container(
        padding: EdgeInsets.symmetric(
          horizontal: dimensions.width13,
          vertical: dimensions.height10,
        ),
        child: GNav(
          selectedIndex: _selectedIndex,
          onTabChange: (value) {
            setState(() {
              _selectedIndex = value;
            });
          },
          activeColor: colors.PrimaryColor,
          color: Colors.grey,
          iconSize: dimensions.size20 * 1.4,
          // textStyle: GoogleFonts.tajawal(fontSize: dimensions.size20),
          tabActiveBorder: Border.all(color: colors.PrimaryColor),
          padding: EdgeInsets.symmetric(
              horizontal: dimensions.width15, vertical: dimensions.height13),
          gap: 10,
          tabs: const [
            GButton(
              icon: Icons.home_outlined,
              text: "Home",
            ),
            GButton(
              icon: Icons.fastfood_outlined,
              text: "Menu",
            ),
            GButton(
              icon: Icons.shopping_cart_outlined,
              text: "Cart",
            ),
            GButton(
              icon: Icons.person_outline,
              text: "Profile",
            ),
          ],
        ),
      ),
      body: pages[_selectedIndex],
    );
  }
}
