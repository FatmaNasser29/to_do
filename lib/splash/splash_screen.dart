import 'dart:async';

import 'package:flutter/material.dart';
import 'package:to_do/lay_out/lay_out.dart';
import 'package:to_do/utils.dart';

class SplashScreen extends StatefulWidget {
  static const String routeName = "splashScreen";

  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    Timer(Duration(seconds: 2), () {
      Navigator.pushReplacementNamed(context, LayOut.routeName);
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Image.asset(getImages("splash_background.png"), fit: BoxFit.fill);
  }
}
