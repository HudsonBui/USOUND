import 'dart:ui';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:usound/assets/colors.dart';
import 'package:usound/assets/fonts.dart';
import 'package:usound/assets/image_url.dart';
import 'package:usound/screens/login/sign_in_screen.dart';
import 'package:usound/widgets/intro/loading_widget.dart';
import 'package:usound/widgets/sign_in_up/sign_in_widget.dart';

class LoadingScreen1 extends StatefulWidget {
  const LoadingScreen1({super.key});

  @override
  State<LoadingScreen1> createState() => _LoadingScreen1State();
}

class _LoadingScreen1State extends State<LoadingScreen1> {
  bool isFirstIntro = true;

  String title = 'Welcome to the World of Music';
  String subTitle =
      'Welcome to the world of music, where emotions are expressed through melody and rhythm. Explore the endless diversity and creativity, from classical to modern tunes, to feel and share the passion for music!';
  String imageUrl = introScreen1Image;

  void _nextScreen(BuildContext context) {
    setState(() {
      print(isFirstIntro);
      if (isFirstIntro) {
        isFirstIntro = false;
      } else {
        Navigator.of(context).pushReplacement(
            MaterialPageRoute(builder: (ctx) => const SignInPage()));
      }
    });
  }

  //Testing
  var isSignIn = true;
  void _setIsSignIn() {
    setState(() {
      isSignIn = !isSignIn;
    });
  }

  final _firebase = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    if (!isFirstIntro) {
      title = 'The best Music Recommendation System';
      subTitle = 'Explore the tunes just for you!';
      imageUrl = introScreen2Image;
    }

    return Scaffold(
      appBar: AppBar(
        actions: isFirstIntro
            ? [
                TextButton(
                  onPressed: () {
                    Navigator.of(context).pushReplacement(MaterialPageRoute(
                        builder: (ctx) => const SignInPage()));
                  },
                  child: Text(
                    'Skip',
                    style: textSmallStyle,
                  ),
                ),
              ]
            : [],
        backgroundColor: solidBackgroundColor,
      ),
      body: Container(
        color: solidBackgroundColor,
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            LoadingWidget(subTitle: subTitle, title: title, imageUrl: imageUrl),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                _nextScreen(context);
              },
              child: Text(
                isFirstIntro ? 'Next' : 'Start',
                style: textSmallStyle.copyWith(color: Colors.black),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
