import 'dart:async';
import 'package:flutter/material.dart';

import '../view/onboarding_screen.dart';

class MySplashScreen extends StatefulWidget {
  const MySplashScreen({Key? key}) : super(key: key);

  @override
  _MySplashScreenState createState() => _MySplashScreenState();
}

class _MySplashScreenState extends State<MySplashScreen> {
  startTimer() {
    Timer(const Duration(seconds: 3), () async {
      // if (await fAuth.currentUser != null) {
      //   currentFirebaseUser = fAuth.currentUser;
      //   Navigator.push(
      //       context, MaterialPageRoute(builder: (c) => MainScreen()));
      // } else {
      Navigator.push(
          context, MaterialPageRoute(builder: (c) => OnboardingScreen()));
      // }
    });
  }

  @override
  void initState() {
    super.initState();

    startTimer();
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Container(
        decoration: BoxDecoration(color: Colors.white),
        child: Center(
          child: Image.asset(
            "assets/icons/logo.png",
            width: 400,
          ),
        ),
      ),
    );
  }
}
