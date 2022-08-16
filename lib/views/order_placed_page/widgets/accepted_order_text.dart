import 'package:flutter/material.dart';

class AcceptedOrderText extends StatelessWidget {
  const AcceptedOrderText({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.symmetric(horizontal: 38.0, vertical: 8),
      child: Text(
        "We've accepted your order, and we're getting it ready",
        style: TextStyle(fontSize: 16, color: Color(0xff7c7c7c)),
        textAlign: TextAlign.center,
      ),
    );
  }
}
