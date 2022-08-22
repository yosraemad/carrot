import 'package:flutter/material.dart';

class SignUpButton extends StatelessWidget {
  const SignUpButton({key}) : super(key: key);

  final fontSize = 18.0;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 46.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            "Don't have any account?",
            style: TextStyle(fontSize: fontSize),
          ),
          const SizedBox(
            width: 5.0,
          ),
          InkWell(
            onTap: () {
              Navigator.pushNamed(context, "/sign-up");
            },
            child: Text(
              "Create One",
              style: TextStyle(
                color: Theme.of(context).primaryColor,
                fontSize: fontSize,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
