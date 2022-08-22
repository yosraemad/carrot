import 'package:flutter/material.dart';

class SuccessImage extends StatelessWidget {
  const SuccessImage({key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Image.asset(
        "assets/images/success.png",
      ),
    );
  }
}
