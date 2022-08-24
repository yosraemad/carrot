import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

// * Green button that is used in multiple pages in the app

typedef OnPressedFunction = Function()?;

class FormButton extends StatelessWidget {
  final String text;
  final OnPressedFunction onPressed;
  final bool isActive;
  const FormButton(
      {key, required this.text, required this.onPressed, this.isActive = true})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 50,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
            elevation: 0, shadowColor: Colors.transparent),
        onPressed: onPressed,
        child: Text(
          text,
          style: const TextStyle(
              color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}
