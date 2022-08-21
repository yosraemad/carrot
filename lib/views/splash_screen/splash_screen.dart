import 'dart:async';

import 'package:carrot_app/main.dart';
import 'package:carrot_app/views/splash_screen/widgets/splash_body.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key, required this.afterSplash});

  final Widget afterSplash;

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  Widget build(BuildContext context) {
    Timer(
        const Duration(seconds: 3),
        () => Navigator.of(context).pushReplacement(
            MaterialPageRoute(builder: (context) => widget.afterSplash)));
    return const Scaffold(
      body: SplashBody(),
    );
  }
}
