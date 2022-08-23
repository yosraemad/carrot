import 'package:flutter/material.dart';

/// Custom Text for the headers in the [ProfileScreen]
class ProfileText extends StatelessWidget {
  const ProfileText(this.text, {key}) : super(key: key);

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
