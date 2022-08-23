import 'package:carrot_app/views/signup_page/bloc/signup_bloc.dart';
import 'package:carrot_app/views/signup_page/widgets/signup_form.dart';
import 'package:carrot_app/views/signup_page/widgets/signup_page_appbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

// The sign up page where the user can create a new user
class SignUpPage extends StatelessWidget {
  static String routeName = "/sign-up";
  const SignUpPage({key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // ! Listens to SignupBloc that is only used in this screen and it's widgets
    return BlocProvider<SignupBloc>(
      create: (context) => SignupBloc(),
      child: Scaffold(
        appBar: const SignUpPageAppBar(),
        body: SingleChildScrollView(child: SignUpForm()),
      ),
    );
  }
}
