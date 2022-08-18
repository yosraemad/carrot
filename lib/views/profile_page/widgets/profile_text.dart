import 'package:flutter/material.dart';

class ProfileText extends StatelessWidget {
  const ProfileText(this.text, {super.key});

  final String text;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
          color: Theme.of(context).primaryColor,
          fontWeight: FontWeight.w700,
          fontSize: 12),
    );
  }
}
