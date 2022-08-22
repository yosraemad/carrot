import 'package:flutter/material.dart';

class HeaderOne extends StatelessWidget {
  final String text;
  const HeaderOne({key, required this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: const TextStyle(fontSize: 36, fontWeight: FontWeight.bold),
    );
  }
}
