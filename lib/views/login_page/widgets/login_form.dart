import 'package:carrot_app/resources/app_doubles.dart';
import 'package:carrot_app/resources/app_strings.dart';
import 'package:carrot_app/views/login_page/bloc/login_bloc.dart';
import 'package:carrot_app/widgets/custom/form_button.dart';
import 'package:carrot_app/widgets/custom/form_textbox.dart';
import 'package:carrot_app/widgets/custom/header_one.dart';
import 'package:carrot_app/views/login_page/widgets/signup_button.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginForm extends StatelessWidget {
  LoginForm({key}) : super(key: key);

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    // * Listens to any errors in the sign in bloc and shows a snackbar of the error
    if (context.watch<LoginBloc>().state is ErrorOccurred) {
      // ! WidgetsBinding is used here to make sure that the snackbar is shown when the function is done building widgets
      WidgetsBinding.instance.addPostFrameCallback((_) {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            content: Text(
                (context.read<LoginBloc>().state as ErrorOccurred).message)));
      });
    }
    return Padding(
      padding: const EdgeInsets.symmetric(
          horizontal: AppDoubles.registerPageHorizontalPadding),
      child: Form(
        key: _formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const HeaderOne(text: AppStrings.loginHeader),
            // * Email textbox
            Padding(
              padding: const EdgeInsets.only(
                  top: AppDoubles.signInTextBoxPaddingTop),
              child: FormTextBox(
                controller: TextEditingController(
                    text: context.watch<LoginBloc>().state.email),
                onChanged: (val) {
                  context
                      .read<LoginBloc>()
                      .add(ChangeEmail(context: context, email: val));
                },
                label: AppStrings.emailTextBox,
                keyboardType: TextInputType.emailAddress,
              ),
            ),
            // * Password textbox
            Padding(
              padding: const EdgeInsets.only(
                  top: AppDoubles.signInTextBoxPaddingTop),
              child: FormTextBox(
                controller: TextEditingController(
                    text: context.watch<LoginBloc>().state.password),
                onChanged: (val) {
                  context
                      .read<LoginBloc>()
                      .add(ChangePassword(context: context, password: val));
                },
                label: AppStrings.passwordTextBox,
                obscureText: true,
              ),
            ),
            // * Forgot Password Button
            Padding(
              padding: const EdgeInsets.only(
                  top: AppDoubles.forgotPasswordPaddingTop),
              child: Align(
                alignment: Alignment.centerRight,
                child: InkWell(
                  onTap: () {},
                  child: Text(
                    AppStrings.forgotPasswordString,
                    style: TextStyle(color: Theme.of(context).primaryColor),
                  ),
                ),
              ),
            ),
            // * Login Button
            Padding(
              padding: const EdgeInsets.only(top: 18.0),
              child: FormButton(
                text: AppStrings.loginHeader,
                onPressed: context.watch<LoginBloc>().state is LoginPressed
                    ? null
                    : () async {
                        if (_formKey.currentState!.validate()) {
                          context
                              .read<LoginBloc>()
                              .add(SubmitLogin(context: context));
                        }
                      },
              ),
            ),
            // * Button that navigates to the sign up screen
            const SignUpButton(),
          ],
        ),
      ),
    );
  }
}
