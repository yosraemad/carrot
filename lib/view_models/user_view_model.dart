import 'package:carrot_app/bloc/app_bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class UserViewModel {
  Future<void> signInUserWithId(BuildContext context, String uid) async {
    context.read<AppBloc>().add(SignIn(userId: uid));
  }

  Future<void> signInUser(
      BuildContext context, String email, String password, bool mounted) async {
    try {
      User? user = (await FirebaseAuth.instance
              .signInWithEmailAndPassword(email: email, password: password))
          .user;
      if (user == null) return;
      if (!mounted) return;

      context.read<AppBloc>().add(SignIn(userId: user.uid));
    } on FirebaseAuthException catch (e) {
      if (e.code == "user-not-found") {
        ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text("No user found for this email")));
      } else if (e.code == "wrong-password") {
        ScaffoldMessenger.of(context)
            .showSnackBar(const SnackBar(content: Text("Wrong Password")));
      }
    } catch (e) {
      ScaffoldMessenger.of(context)
          .showSnackBar(const SnackBar(content: Text("An Error Occurred")));
    }
  }

  Future<bool> createUser(
      BuildContext context, String email, String password) async {
    try {
      final User? user = (await FirebaseAuth.instance
              .createUserWithEmailAndPassword(email: email, password: password))
          .user;
      if (user != null) {
        context.read<AppBloc>().add(SignUp(userId: user.uid));
        return true;
      } else {
        ScaffoldMessenger.of(context)
            .showSnackBar(const SnackBar(content: Text("An Error Occurred")));
      }
    } on FirebaseAuthException catch (e) {
      if (e.code == "weak-password") {
        ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text("The password provided is too weak")));
      } else if (e.code == "email-already-in-use") {
        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
            content: Text("An account already exists for that email")));
      }
    } catch (e) {
      ScaffoldMessenger.of(context)
          .showSnackBar(const SnackBar(content: Text("An Error Occurred")));
    }
    return false;
  }

  Future<void> signOutUser(BuildContext context) async {
    try {
      await FirebaseAuth.instance.signOut();
      context.read<AppBloc>().add(const SignOut());
    } catch (e) {
      ScaffoldMessenger.of(context)
          .showSnackBar(const SnackBar(content: Text("An Error Occurred")));
      if (kDebugMode) {
        print(e);
      }
    }
  }
}
