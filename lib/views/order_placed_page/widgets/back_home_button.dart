import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class BackHomeButton extends StatelessWidget {
  const BackHomeButton({key}): super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 100.0),
      child: TextButton(
        child: const Text(
          "Back Home",
          style: TextStyle(color: Colors.black),
        ),
        onPressed: () {
          Navigator.pushNamedAndRemoveUntil(context, "/home", (route) => false);
        },
      ),
    );
  }
}
