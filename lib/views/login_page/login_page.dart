import 'package:carrot_app/views/login_page/bloc/login_bloc.dart';
import 'package:carrot_app/views/login_page/widgets/header_image.dart';
import 'package:carrot_app/views/login_page/widgets/login_form.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginPage extends StatelessWidget {
  static String routeName = "/login";
  const LoginPage({key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => LoginBloc(),
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const HeaderImage(),
              LoginForm(),
            ],
          ),
        ),
      ),
    );
  }
}
