import 'package:carrot_app/view_models/user_view_model.dart';
import 'package:carrot_app/widgets/custom/form_button.dart';
import 'package:carrot_app/widgets/custom/form_textbox.dart';
import 'package:carrot_app/widgets/custom/header_one.dart';
import 'package:carrot_app/views/login_page/widgets/signup_button.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginForm extends StatefulWidget {
  const LoginForm({super.key});

  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  final TextEditingController _emailController = TextEditingController();

  final TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Form(
        key: _formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const HeaderOne(text: "Login"),
            Padding(
              padding: const EdgeInsets.only(top: 10.0),
              child: FormTextBox(
                controller: _emailController,
                onChanged: (val) {
                  setState(() {
                    _emailController.text = val;
                  });
                },
                label: "Email",
                keyboardType: TextInputType.emailAddress,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 10.0),
              child: FormTextBox(
                controller: _passwordController,
                onChanged: (val) {
                  setState(() {
                    _passwordController.text = val;
                  });
                },
                label: "Password",
                obscureText: true,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 8.0),
              child: Align(
                alignment: Alignment.centerRight,
                child: InkWell(
                  onTap: () {},
                  child: Text(
                    "Forgot Password?",
                    style: TextStyle(color: Theme.of(context).primaryColor),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 18.0),
              child: FormButton(
                text: "Login",
                onPressed: () async {
                  if (_formKey.currentState!.validate()) {
                    await UserViewModel().signInUser(
                        context,
                        _emailController.text,
                        _passwordController.text,
                        mounted);
                  }
                },
              ),
            ),
            const SignUpButton(),
          ],
        ),
      ),
    );
  }
}
