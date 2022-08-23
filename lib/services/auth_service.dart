import 'package:carrot_app/utils/firebase_exception.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AuthService {
  // sign in user in the firebase auth
  static Future<User?> signInUser(String email, String password) async {
    try {
      return (await FirebaseAuth.instance
              .signInWithEmailAndPassword(email: email, password: password))
          .user;
    } on FirebaseAuthException catch (e) {
      if (e.code == "user-not-found") {
        throw AppException("No User Found with this email");
      } else if (e.code == "wrong-password") {
        throw AppException("Wrong Password");
      }
    } catch (e) {
      throw AppException("An Error Occurred");
    }
    return null;
  }

  // sign up user in the firebase auth
  static Future<User?> signUpUser(String email, String password) async {
    try {
      return (await FirebaseAuth.instance
              .createUserWithEmailAndPassword(email: email, password: password))
          .user;
    } on FirebaseAuthException catch (e) {
      if (e.code == "weak-password") {
        throw AppException("The password provided is too weak");
      } else if (e.code == "email-already-in-use") {
        throw AppException("An account already exists for that email");
      }
    } catch (e) {
      throw AppException("An error occurred");
    }
    return null;
  }

  // sign out user in the firebase auth
  static Future<void> signOutUser() async {
    try {
      await FirebaseAuth.instance.signOut();
    } catch (e) {
      throw AppException("An Error Occurred");
    }
  }
}
