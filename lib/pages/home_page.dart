import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 1,
        title: Padding(
          padding: const EdgeInsets.only(left: 8.0),
          child: Row(
            children: [
              Container(
                width: 32,
                decoration: BoxDecoration(boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.1),
                    spreadRadius: 0,
                    blurRadius: 20,
                    offset: const Offset(4, 8),
                  )
                ]),
                child: Image.asset(
                  "assets/images/logo.png",
                ),
              ),
              const SizedBox(width: 4),
              const Text(
                "Carrot",
                style: TextStyle(
                    fontWeight: FontWeight.w700, color: Color(0xff828282)),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
