// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:food_app/main.dart';
import 'package:food_app/pages/Authentification/Service.dart';
import 'package:food_app/pages/Authentification/forgetPasswordPage.dart';
import 'package:food_app/pages/Authentification/signupPage.dart';
import 'package:food_app/pages/MainPages/MainPage.dart';
import 'package:food_app/pages/MainPages/homePage.dart';
import 'package:food_app/util/bigText.dart';
import 'package:food_app/util/colors.dart';
import 'package:food_app/util/dimensions.dart';
import 'package:food_app/util/signinButton.dart';
import 'package:food_app/util/smallText.dart';
import 'package:google_fonts/google_fonts.dart';

class checkSignIn extends StatelessWidget {
  const checkSignIn({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder<User?>(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          if (snapshot.hasData) {
            return mainPage();
          } else {
            return signinPage();
          }
        },
      ),
    );
  }
}

class signinPage extends StatefulWidget {
  const signinPage({super.key});

  @override
  State<signinPage> createState() => _signinPageState();
}

class _signinPageState extends State<signinPage> {
  bool isShow = true;
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
                SizedBox(height: dimensions.height15),
                bigText(text: "Welcome Back 👋"),
                SizedBox(height: dimensions.height10),
                smallText(text: "Sign to your account"),
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
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    GestureDetector(
                      onTap: () {
                        Navigator.push(context, MaterialPageRoute(
                          builder: (context) {
                            return forgetPasswordPage();
                          },
                        ));
                      },
                      child: Text(
                        "Forget Password ",
                        style: TextStyle(
                          fontSize: dimensions.size15 * 1.3,
                          fontWeight: FontWeight.w600,
                          color: colors.PrimaryColor,
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: dimensions.height22),
                GestureDetector(
                  onTap: () {
                    if (_emailController.text.isNotEmpty &&
                        _passwordController.text.isNotEmpty) {
                      service.signin(_emailController.text.trim(),
                          _passwordController.text.trim(), context);
                    } else {
                      service.error(context, "Text Field Musn't be empty");
                    }
                    
                  },
                  child: signinButton(
                    backgroundColor: colors.PrimaryColor,
                    textColor: Colors.white,
                    text: "Log in",
                  ),
                ),
                SizedBox(height: dimensions.height22),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      "Don't have an account? ",
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
                            return signupPage();
                          },
                        ));
                      },
                      child: Text(
                        "Sign Up",
                        style: TextStyle(
                          fontSize: dimensions.size15 * 1.3,
                          fontWeight: FontWeight.w600,
                          color: colors.PrimaryColor,
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: dimensions.height20),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Expanded(
                      child: Container(
                        height: 1,
                        color: colors.PrimaryColor,
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.all(dimensions.size10),
                      child: smallText(
                        text: "Or with",
                        font: FontWeight.w700,
                      ),
                    ),
                    Expanded(
                      child: Container(
                        height: 1,
                        color: colors.PrimaryColor,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: dimensions.height22),
                GestureDetector(
                  onTap: () {
                    service.signInWithGoogle();
                  },
                  child: Container(
                    width: dimensions.screenWidth,
                    height: dimensions.height20 * 3.4,
                    decoration: BoxDecoration(
                      border: Border.all(color: colors.SmallText, width: 1.2),
                      borderRadius: BorderRadius.circular(dimensions.size15),
                      color: Colors.transparent,
                    ),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Padding(
                          padding: EdgeInsets.only(bottom: dimensions.width7),
                          child: Image.asset(
                            "lib/icons/google_logo.png",
                            width: dimensions.width5 * 5.2,
                          ),
                        ),
                        SizedBox(width: dimensions.width20),
                        Text(
                          "Sign in with google",
                          style: GoogleFonts.tajawal(
                            fontSize: dimensions.size24,
                            fontWeight: FontWeight.w700,
                            color: colors.BigTextColor,
                          ),
                        )
                      ],
                    ),
                  ),
                ),
                SizedBox(height: dimensions.height13),
                Container(
                  width: dimensions.screenWidth,
                  height: dimensions.height20 * 3.4,
                  decoration: BoxDecoration(
                    border: Border.all(color: colors.SmallText, width: 1.2),
                    borderRadius: BorderRadius.circular(dimensions.size15),
                    color: Colors.transparent,
                  ),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Padding(
                        padding: EdgeInsets.only(bottom: dimensions.width7),
                        child: Image.asset(
                          "lib/icons/apple-logo.png",
                          height: dimensions.width5 * 6,
                        ),
                      ),
                      SizedBox(width: dimensions.width20),
                      Text(
                        "Sign in with Apple",
                        style: GoogleFonts.tajawal(
                          fontSize: dimensions.size24,
                          fontWeight: FontWeight.w700,
                          color: colors.BigTextColor,
                        ),
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
