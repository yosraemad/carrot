import 'package:flutter/material.dart';

// Image that appears on top of the login page
class HeaderImage extends StatelessWidget {
  const HeaderImage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      alignment: Alignment.topRight,
      child: Image.asset(
        "assets/images/login_header.png",
      ),
    );
  }
}
