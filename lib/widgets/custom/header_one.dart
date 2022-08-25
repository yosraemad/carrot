import 'package:carrot_app/resources/app_doubles.dart';
import 'package:carrot_app/resources/app_font_weights.dart';
import 'package:flutter/material.dart';

// * Text that is used as a header for both sign up and log in pages
class HeaderOne extends StatelessWidget {
  final String text;
  const HeaderOne({key, required this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: const TextStyle(
          fontSize: AppDoubles.headerOneFontSize,
          fontWeight: AppFontWeights.headerOneFontWeight),
    );
  }
}
