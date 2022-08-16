import 'package:flutter/cupertino.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class SuccessText extends StatelessWidget {
  const SuccessText({super.key});

  @override
  Widget build(BuildContext context) {
    return const Text(
      "Your Order Has Been Accepted",
      style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
    );
  }
}
