import 'package:flutter/material.dart';

class HeaderOne extends StatelessWidget {
  final String text;
  const HeaderOne({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: const TextStyle(fontSize: 36, fontWeight: FontWeight.bold),
    );
  }
}
