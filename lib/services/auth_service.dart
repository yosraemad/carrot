import 'package:carrot_app/constants/app_strings.dart';
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
      if (e.code == AppStrings.noUserExceptionCode) {
        throw AppException(AppStrings.noUserExceptionText);
      } else if (e.code == AppStrings.wrongPasswordExceptionCode) {
        throw AppException(AppStrings.wrongPasswordExceptionText);
      }
    } catch (e) {
      throw AppException(AppStrings.errorText);
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
      if (e.code == AppStrings.weakPasswordExceptionCode) {
        throw AppException(AppStrings.weakPasswordExceptionText);
      } else if (e.code == AppStrings.emailInUseExceptionCode) {
        throw AppException(AppStrings.emailInUseExceptionText);
      }
    } catch (e) {
      throw AppException(AppStrings.errorText);
    }
    return null;
  }

  // sign out user in the firebase auth
  static Future<void> signOutUser() async {
    try {
      await FirebaseAuth.instance.signOut();
    } catch (e) {
      throw AppException(AppStrings.errorText);
    }
  }
}
