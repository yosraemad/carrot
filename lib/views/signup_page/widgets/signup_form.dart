import 'package:carrot_app/view_models/user_view_model.dart';
import 'package:carrot_app/views/signup_page/bloc/signup_bloc.dart';
import 'package:carrot_app/widgets/custom/form_button.dart';
import 'package:carrot_app/widgets/custom/form_textbox.dart';
import 'package:carrot_app/widgets/custom/header_one.dart';
import 'package:carrot_app/views/signup_page/widgets/terms_and_conditions.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SignUpForm extends StatelessWidget {
  SignUpForm({key}) : super(key: key);

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Form(
        key: _formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Padding(
              padding: EdgeInsets.only(top: 32.0),
              child: HeaderOne(text: "Register"),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 27.0),
              child: FormTextBox(
                controller: TextEditingController(
                    text: context.watch<SignupBloc>().state.email),
                onChanged: (val) {
                  context
                      .read<SignupBloc>()
                      .add(ChangeEmail(context: context, email: val));
                },
                label: "Email",
                keyboardType: TextInputType.emailAddress,
                validator: ((value) {
                  if (value == null || value.isEmpty) {
                    return "Please enter a value";
                  }
                  return null;
                }),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 35.0),
              child: FormTextBox(
                controller: TextEditingController(
                    text: context.watch<SignupBloc>().state.password),
                onChanged: (val) {
                  context
                      .read<SignupBloc>()
                      .add(ChangePassword(context: context, password: val));
                },
                label: "Password",
                obscureText: true,
                validator: ((value) {
                  if (value == null || value.isEmpty) {
                    return "Please enter a value";
                  }
                  return null;
                }),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 35.0),
              child: FormTextBox(
                controller: TextEditingController(
                    text: context.watch<SignupBloc>().state.verifyPassword),
                onChanged: (val) {
                  context.read<SignupBloc>().add(ChangeVerifyPassword(
                      context: context, verifyPassword: val));
                },
                label: "Verify Password",
                obscureText: true,
                validator: ((value) {
                  if (value != context.read<SignupBloc>().state.password) {
                    return "Not the same password";
                  }
                  return null;
                }),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 32.0),
              child: FormButton(
                text: "Register",
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    context
                        .read<SignupBloc>()
                        .add(SubmitSignUp(context: context));
                  }
                },
              ),
            ),
            const TermsAndConditions()
          ],
        ),
      ),
    );
  }
}
