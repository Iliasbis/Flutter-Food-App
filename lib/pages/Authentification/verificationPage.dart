import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:food_app/pages/MainPages/homePage.dart';
import 'package:food_app/util/bigText.dart';
import 'package:food_app/util/dimensions.dart';
import 'package:food_app/util/smallText.dart';

class verificationPage extends StatefulWidget {
  const verificationPage({super.key});

  @override
  State<verificationPage> createState() => _verificationPageState();
}

class _verificationPageState extends State<verificationPage> {
  bool isVerified = false;
  Timer? timer;

  @override
  void dispose() {
    // to dispose the timer when they don't work
    timer?.cancel();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    //check if the email is Verified
    isVerified = FirebaseAuth.instance.currentUser!.emailVerified;
    //if the email is not verified we send the verification in the email
    if (!isVerified) {
      sendVerification();
      // we check if the email is verified every 2 seconds
    }
    timer = Timer.periodic(Duration(seconds: 2), (timer) {
      (_) => checkEmail();
    });
  }

  // the function for check the email if is verified
  Future checkEmail() async {
    //we must reload the current user to see if is verified
    await FirebaseAuth.instance.currentUser!.reload();
    setState(() {
      isVerified = FirebaseAuth.instance.currentUser!.emailVerified;
    });
    // if the email is verified we cancel the timer (timer is checking every 2 seconds)
    if (isVerified) {
      timer?.cancel();
    }
  }

  // the function to send the verification to the email
  Future sendVerification() async {
    try {
      //we send the verification mail
      final user = FirebaseAuth.instance.currentUser!;
      await user.sendEmailVerification();
    } catch (e) {
      showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            content: Text(
              e.toString(),
              style: TextStyle(
                  color: Colors.black, fontSize: dimensions.size10 * 1.7),
            ),
            icon: Icon(Icons.error_outline),
          );
        },
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    print(FirebaseAuth.instance.currentUser!.emailVerified);
    return isVerified
        ? homePage()
        : Scaffold(
            body: SafeArea(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: dimensions.width15),
                child: Column(
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
                    bigText(text: "Verify your email"),
                    smallText(text: "Check your email"),
                    MaterialButton(
                      onPressed: sendVerification,
                      color: Colors.deepPurple.shade300,
                      child: bigText(text: "Resend verififcation"),
                    ),
                  ],
                ),
              ),
            ),
          );
  }
}
