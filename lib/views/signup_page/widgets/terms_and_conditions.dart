import 'package:flutter/material.dart';

class TermsAndConditions extends StatelessWidget {
  const TermsAndConditions({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 48.0, vertical: 12.0),
      child: RichText(
          textAlign: TextAlign.center,
          text: TextSpan(
            children: [
              const TextSpan(
                text: "By creating an account you are agreeing to our ",
                style: TextStyle(color: Colors.black),
              ),
              TextSpan(
                text: "Terms of Service ",
                style: TextStyle(color: Theme.of(context).primaryColor),
              ),
              const TextSpan(
                text: "and ",
                style: TextStyle(color: Colors.black),
              ),
              TextSpan(
                text: "Privacy Policy",
                style: TextStyle(color: Theme.of(context).primaryColor),
              ),
            ],
          )),
    );
  }
}
