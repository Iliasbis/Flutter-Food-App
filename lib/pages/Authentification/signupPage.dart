// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:food_app/pages/Authentification/Service.dart';
import 'package:food_app/pages/Authentification/signinPage.dart';
import 'package:food_app/util/bigText.dart';
import 'package:food_app/util/colors.dart';
import 'package:food_app/util/dimensions.dart';
import 'package:food_app/util/signinButton.dart';
import 'package:food_app/util/smallText.dart';
import 'package:google_fonts/google_fonts.dart';

class signupPage extends StatefulWidget {
  const signupPage({super.key});

  @override
  State<signupPage> createState() => _signupPageState();
}

class _signupPageState extends State<signupPage> {
  bool isShow = false;
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  Service service = Service();
  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: dimensions.width15),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: dimensions.height10),
                Row(
                  children: [
                    GestureDetector(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: Icon(
                        Icons.arrow_back,
                        size: dimensions.size15 * 2.3,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: dimensions.height50),
                bigText(text: "Sign up"),
                SizedBox(height: dimensions.height10),
                smallText(text: "Create account and choose favorite menu"),
                SizedBox(height: dimensions.height15),
                Text(
                  "Name",
                  style: GoogleFonts.tajawal(
                    fontSize: dimensions.size20,
                    fontWeight: FontWeight.w700,
                    color: colors.BigTextColor,
                  ),
                ),
                SizedBox(height: dimensions.height5),
                Container(
                  width: dimensions.screenWidth,
                  height: dimensions.height20 * 3.2,
                  decoration: BoxDecoration(
                    color: colors.secondeButtonColor,
                    border: Border.all(
                      color: colors.SmallText,
                    ),
                    borderRadius: BorderRadius.circular(
                      dimensions.size15,
                    ),
                  ),
                  child: Padding(
                    padding: EdgeInsets.only(
                        left: dimensions.width22, top: dimensions.height5),
                    child: TextField(
                      style: TextStyle(fontSize: 18),
                      decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: "Your Name",
                          hintStyle: TextStyle(
                            fontSize: dimensions.size15 * 1.2,
                            fontWeight: FontWeight.w600,
                            color: colors.SmallText,
                          )),
                    ),
                  ),
                ),
                SizedBox(height: dimensions.height15),
                Text(
                  "Email",
                  style: GoogleFonts.tajawal(
                    fontSize: dimensions.size20,
                    fontWeight: FontWeight.w700,
                    color: colors.BigTextColor,
                  ),
                ),
                SizedBox(height: dimensions.height5),
                Container(
                  width: dimensions.screenWidth,
                  height: dimensions.height20 * 3.2,
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: colors.SmallText,
                    ),
                    color: colors.secondeButtonColor,
                    borderRadius: BorderRadius.circular(
                      dimensions.size15,
                    ),
                  ),
                  child: Padding(
                    padding: EdgeInsets.only(
                        left: dimensions.width22, top: dimensions.height5),
                    child: TextField(
                      controller: _emailController,
                      style: TextStyle(fontSize: 18),
                      decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: "Your Email",
                          hintStyle: TextStyle(
                            fontSize: dimensions.size15 * 1.2,
                            fontWeight: FontWeight.w600,
                            color: colors.SmallText,
                          )),
                    ),
                  ),
                ),
                SizedBox(height: dimensions.height15),
                Text(
                  "Password",
                  style: GoogleFonts.tajawal(
                    fontSize: dimensions.size20,
                    fontWeight: FontWeight.w700,
                    color: colors.BigTextColor,
                  ),
                ),
                SizedBox(height: dimensions.height5),
                Container(
                  width: dimensions.screenWidth,
                  height: dimensions.height20 * 3.2,
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: colors.SmallText,
                    ),
                    color: colors.secondeButtonColor,
                    borderRadius: BorderRadius.circular(
                      dimensions.size15,
                    ),
                  ),
                  child: Padding(
                    padding: EdgeInsets.only(
                        left: dimensions.width22, top: dimensions.height5),
                    child: TextField(
                      controller: _passwordController,
                      obscureText: isShow,
                      style: TextStyle(fontSize: 18),
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        suffixIcon: GestureDetector(
                          onTap: () {
                            setState(() {
                              isShow = !isShow;
                            });
                          },
                          child: Icon(
                            Icons.remove_red_eye_outlined,
                            color: colors.PrimaryColor,
                          ),
                        ),
                        hintText: "Your Password",
                        hintStyle: TextStyle(
                          fontSize: dimensions.size15 * 1.2,
                          fontWeight: FontWeight.w600,
                          color: colors.SmallText,
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: dimensions.height15),
                SizedBox(height: dimensions.height22),
                GestureDetector(
                  onTap: () {
                    if (_emailController.text.isNotEmpty &&
                        _passwordController.text.isNotEmpty) {
                      service.signup(_emailController.text.trim(),
                          _passwordController.text.trim(), context);
                    } else {
                      service.error(context, "Field musn't be empty");
                    }
                  },
                  child: signinButton(
                    backgroundColor: colors.PrimaryColor,
                    textColor: Colors.white,
                    text: "Register",
                  ),
                ),
                SizedBox(height: dimensions.height22),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      "Have an account? ",
                      style: TextStyle(
                        fontSize: dimensions.size15 * 1.3,
                        fontWeight: FontWeight.w500,
                        color: colors.SmallText,
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.pushReplacement(context, MaterialPageRoute(
                          builder: (context) {
                            return signinPage();
                          },
                        ));
                      },
                      child: Text(
                        "Sign In",
                        style: TextStyle(
                          fontSize: dimensions.size15 * 1.3,
                          fontWeight: FontWeight.w600,
                          color: colors.PrimaryColor,
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: dimensions.height120),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    smallText(text: "By Clicking Register, you agree to our"),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Terms and Data Policy.",
                      style: TextStyle(
                        fontSize: dimensions.size15 * 1.2,
                        fontWeight: FontWeight.w600,
                        color: colors.PrimaryColor,
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
