import 'package:carrot_app/widgets/login_page/login_form.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: double.infinity,
              alignment: Alignment.topRight,
              child: Image.asset(
                "assets/images/login_header.png",
              ),
            ),
            LoginForm(),
          ],
        ),
      ),
    );
  }
}
