import 'package:flutter/material.dart';

class ChangeLanguage extends StatelessWidget {
  const ChangeLanguage({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 40,
      width: 83,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: const [
          Text(
            "English",
            style: TextStyle(
                color: Color(0xff828282),
                fontWeight: FontWeight.w500,
                fontSize: 16),
          ),
          Icon(
            Icons.chevron_right,
            size: 30,
          ),
        ],
      ),
    );
  }
}
