import 'package:carrot_app/views/login_page/widgets/header_image.dart';
import 'package:carrot_app/views/login_page/widgets/login_form.dart';
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
          children: const [
            HeaderImage(),
            LoginForm(),
          ],
        ),
      ),
    );
  }
}
