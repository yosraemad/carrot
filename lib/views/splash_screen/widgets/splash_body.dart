import 'package:flutter/material.dart';

class SplashBody extends StatelessWidget {
  const SplashBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            decoration: const BoxDecoration(boxShadow: [
              BoxShadow(
                  blurRadius: 8, offset: Offset(4, 8), color: Color(0x0A000000))
            ]),
            child: Image.asset(
              "assets/images/logo.png",
              width: 100,
            ),
          ),
          const Padding(
            padding: EdgeInsets.only(top: 12.0),
            child: Text(
              "Carrot",
              style: TextStyle(
                  color: Color(0xff534f70),
                  fontWeight: FontWeight.bold,
                  fontSize: 24),
            ),
          ),
          const Text("Your Grocery Market",
              style: TextStyle(
                color: Color(0xff534f70),
              ))
        ],
      ),
    );
  }
}
