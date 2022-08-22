import 'package:carrot_app/views/signup_page/bloc/signup_bloc.dart';
import 'package:carrot_app/views/signup_page/widgets/signup_form.dart';
import 'package:carrot_app/views/signup_page/widgets/signup_page_appbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SignUpPage extends StatelessWidget {
  static String routeName = "/sign-up";
  const SignUpPage({key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider<SignupBloc>(
      create: (context) => SignupBloc(),
      child: Scaffold(
        appBar: const SignUpPageAppBar(),
        body: SingleChildScrollView(child: SignUpForm()),
      ),
    );
  }
}
