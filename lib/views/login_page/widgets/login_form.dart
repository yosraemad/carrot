import 'package:carrot_app/bloc/user_bloc.dart';
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
                  try {
                    if (_formKey.currentState!.validate()) {
                      User? user = (await FirebaseAuth.instance
                              .signInWithEmailAndPassword(
                                  email: _emailController.text,
                                  password: _passwordController.text))
                          .user;
                      if (!mounted) return;
                      if (user != null) {
                        context.read<UserBloc>().add(SignUp(userId: user.uid));
                        Navigator.pushNamedAndRemoveUntil(
                            context, "/home", (route) => false);
                      }
                    }
                  } on FirebaseAuthException catch (e) {
                    if (e.code == "user-not-found") {
                      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                          content: Text("No user found for this email")));
                    } else if (e.code == "wrong-password") {
                      ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(content: Text("Wrong Password")));
                    }
                  } catch (e) {
                    ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text("An Error Occurred")));
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
