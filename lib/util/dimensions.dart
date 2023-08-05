// ignore_for_file: camel_case_types
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class dimensions {
  static double screenHeight = Get.size.height;
  static double screenWidth = Get.size.width;
  /*the dimensions of item on any screen is height of items in your screen
  divised by the height of item example 
  (the height of my screen is 802 and the height of item is 220 so 
  the responsive height is 802/220 = x
  screen Height / x 
  )
  */
  // static double width2 = screenHeight/
  // Height of this screen = 866.28
  // Width of This screen = 411.42


  // Screen Height
  static double height5 = screenHeight / 173.25;
  static double height10 = screenHeight / 86.6;
  static double height13 = screenHeight / 66.63;
  static double height15 = screenHeight / 57.75;
  static double height20 = screenHeight / 43.31;
  static double height22 = screenHeight / 39.37;
  static double height50 = screenHeight / 17.32;
  static double height100 = screenHeight / 8.6628;
  static double height120 = screenHeight / 7.219;
  static double height180 = screenHeight / 4.81;

  // Font Size and Icon Size
  static double size5 = screenHeight / 173.25;
  static double size10 = screenHeight / 86.6;
  static double size13 = screenHeight / 66.63;
  static double size15 = screenHeight / 57.75;
  static double size20 = screenHeight / 43.31;
  static double size24 = screenHeight / 36.41;

  // Screen Width 411.42
  static double width5 = screenWidth / 82.28;
  static double width7 = screenWidth / 58.77;
  static double width10 = screenWidth / 41.142;
  static double width13 = screenWidth / 31.64;
  static double width15 = screenWidth / 27.42;
  static double width20 = screenWidth / 20.57;
  static double width22 = screenWidth / 18.7;
  static double width50 = screenWidth / 8.22;
  static double width100 = screenWidth / 4.11;
  static double width110 = screenWidth / 3.74;
}
