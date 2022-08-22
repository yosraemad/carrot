import 'package:carrot_app/views/signup_page/widgets/signup_form.dart';
import 'package:carrot_app/views/signup_page/widgets/signup_page_appbar.dart';
import 'package:flutter/material.dart';

class SignUpPage extends StatelessWidget {
  static String routeName = "/sign-up";
  const SignUpPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: SignUpPageAppBar(),
      body: SingleChildScrollView(child: SignUpForm()),
    );
  }
}
