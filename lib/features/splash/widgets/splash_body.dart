import 'package:flutter/material.dart';

class SplashBody extends StatelessWidget {
  const SplashBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      "assets/images/appIcon.png",
      width: MediaQuery.of(context).size.width * 0.6,
    );
  }
}