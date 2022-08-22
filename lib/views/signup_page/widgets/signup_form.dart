import 'package:carrot_app/view_models/user_view_model.dart';
import 'package:carrot_app/widgets/custom/form_button.dart';
import 'package:carrot_app/widgets/custom/form_textbox.dart';
import 'package:carrot_app/widgets/custom/header_one.dart';
import 'package:carrot_app/views/signup_page/widgets/terms_and_conditions.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SignUpForm extends StatefulWidget {
  const SignUpForm({key}) : super(key: key);

  @override
  State<SignUpForm> createState() => _SignUpFormState();
}

class _SignUpFormState extends State<SignUpForm> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  final TextEditingController _emailController = TextEditingController();

  final TextEditingController _passwordController = TextEditingController();

  final TextEditingController _verifyPasswordController =
      TextEditingController();

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
                controller: _emailController,
                onChanged: (val) {
                  setState(() {
                    _emailController.text = val;
                  });
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
                controller: _passwordController,
                onChanged: (val) {
                  setState(() {
                    _passwordController.text = val;
                  });
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
                controller: _verifyPasswordController,
                onChanged: (val) {
                  setState(() {
                    _verifyPasswordController.text = val;
                  });
                },
                label: "Verify Password",
                obscureText: true,
                validator: ((value) {
                  if (value != _passwordController.text) {
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
                onPressed: () async {
                  if (_formKey.currentState!.validate()) {
                    await UserViewModel().createUser(
                        context,
                        _emailController.text,
                        _passwordController.text,
                        mounted);
                    if (!mounted) return;
                    Navigator.pop(context);
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
