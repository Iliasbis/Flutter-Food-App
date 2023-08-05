import 'dart:math';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:food_app/pages/Authentification/verificationPage.dart';
import 'package:food_app/pages/MainPages/MainPage.dart';
import 'package:google_sign_in/google_sign_in.dart';

import 'dart:async';
import 'package:google_sign_in_android/google_sign_in_android.dart';
import 'package:flutter/material.dart';
import 'package:food_app/pages/MainPages/homePage.dart';
import 'package:food_app/util/colors.dart';
import 'package:food_app/util/dimensions.dart';
import 'package:food_app/util/smallText.dart';

class Service {
  final auth = FirebaseAuth.instance;
  signin(email, password, context) async {
    try {
      await auth
          .signInWithEmailAndPassword(email: email, password: password)
          .then(
            (value) => Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) {
                  return const mainPage();
                },
              ),
            ),
          );
    } on FirebaseAuthException catch (e) {
      error(context, e.message.toString());
    }
  }

  signup(email, password, context) async {
    try {
      await auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      auth.currentUser!.reload().then(
            (value) => Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) {
                  return const mainPage();
                },
              ),
            ),
          );
    } on FirebaseException catch (e) {
      error(context, e.message.toString());
    }
  }

  error(context, e) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          elevation: 0,
          backgroundColor: colors.secondeButtonColor,
          content: Text(
            e.toString(),
            style: TextStyle(
                color: Colors.black, fontSize: dimensions.size10 * 1.8),
          ),
          icon: Icon(
            Icons.error_outline,
            size: dimensions.size15 * 2,
            color: Colors.red,
          ),
        );
      },
    );
  }

  signInWithGoogle() async {
    final GoogleSignInAccount? googleUser =
        await GoogleSignIn(scopes: <String>["email"]).signIn();

    final GoogleSignInAuthentication googleAuth =
        await googleUser!.authentication;

    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth.accessToken,
      idToken: googleAuth.idToken,
    );
    return await FirebaseAuth.instance.signInWithCredential(credential);
  }
}
