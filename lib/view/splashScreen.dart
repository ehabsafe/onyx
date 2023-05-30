import 'dart:async';

import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:onyx_delivery_service/utils/theme.dart';
import 'package:onyx_delivery_service/view/loginScreen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(
        const Duration(seconds: 3),
        () => Navigator.pushReplacement(context,
            MaterialPageRoute(builder: (context) => const LoginScreen())));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: lightColor,
      body: ListView(
        children: [
          Center(
            child: Padding(
              padding: const EdgeInsets.only(top: 70),
              child: Image.asset(
                "assets/images/logo.png",
                height: MediaQuery.of(context).size.height / 2.2,
              ),
            ),
          ),
          Stack(
            children: [
              Container(
                  height: MediaQuery.of(context).size.height /2 ,
                  width: MediaQuery.of(context).size.width,
                  child: LottieBuilder.asset("assets/animations/background.json")),
              Center(
                child: Image.asset(
                  "assets/images/bik.png",
                  height: MediaQuery.of(context).size.height / 2,
                  width: MediaQuery.of(context).size.width / 2,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
