import 'package:flutter/material.dart';

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
