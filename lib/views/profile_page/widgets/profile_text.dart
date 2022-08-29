import 'package:carrot_app/resources/app_doubles.dart';
import 'package:carrot_app/resources/app_font_weights.dart';
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
          fontWeight: AppFontWeights.profileTextFontWeight, //TODO
          fontSize: AppDoubles.smallFontSize),
    );
  }
}
