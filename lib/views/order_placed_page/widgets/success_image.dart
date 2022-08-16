import 'package:flutter/material.dart';

class SuccessImage extends StatelessWidget {
  const SuccessImage({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Image.asset(
        "assets/images/success.png",
      ),
    );
  }
}
