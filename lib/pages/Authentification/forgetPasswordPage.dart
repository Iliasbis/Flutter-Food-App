
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:food_app/pages/Authentification/Service.dart';
import 'package:food_app/pages/Authentification/congratulationPage.dart';
import 'package:food_app/util/bigText.dart';
import 'package:food_app/util/colors.dart';
import 'package:food_app/util/dimensions.dart';
import 'package:food_app/util/signinButton.dart';
import 'package:food_app/util/smallText.dart';

class forgetPasswordPage extends StatefulWidget {
  const forgetPasswordPage({super.key});

  @override
  State<forgetPasswordPage> createState() => _forgetPasswordPageState();
}

class _forgetPasswordPageState extends State<forgetPasswordPage> {
  Service service = Service();

  final _emailController = TextEditingController();
  Future sendNewPassword() async {
    try {
      await FirebaseAuth.instance
          .sendPasswordResetEmail(email: _emailController.text.trim())
          .then((value) => Navigator.push(context, MaterialPageRoute(
                builder: (context) {
                  return congratulationPage();
                },
              )));
    } on FirebaseException catch (e) {
      service.error(context, e.message.toString());
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: GestureDetector(
          onTap: () {
            Navigator.pop(context);
          },
          child: Icon(
            Icons.arrow_back,
            size: dimensions.size15 * 2.3,
            color: colors.BigTextColor,
          ),
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: dimensions.width15),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              bigText(text: "Forget Password"),
              SizedBox(height: dimensions.height15),
              smallText(text: "Enter your email to send the reset message "),
              SizedBox(height: dimensions.height20),
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
              SizedBox(height: dimensions.height22),
              GestureDetector(
                onTap: () {
                  if (_emailController.text.isNotEmpty) {
                    sendNewPassword();
                  } else {
                    service.error(context, "Email field musn't be empty");
                  }
                },
                child: signinButton(
                  backgroundColor: colors.PrimaryColor,
                  textColor: Colors.white,
                  text: "Continue",
                ),
              ),
              SizedBox(
                height: dimensions.height22,
              )
            ],
          ),
        ),
      ),
    );
  }
}
