part of 'signup_bloc.dart';

// defining events of the sign up bloc
abstract class SignupEvent extends Equatable {
  const SignupEvent(
      {required this.context,
      required this.email,
      required this.password,
      required this.verifyPassword});
  final BuildContext context;
  final String email;
  final String password;
  final String verifyPassword;

  @override
  List<Object> get props => [];
}

class ChangeEmail extends SignupEvent {
  const ChangeEmail({required BuildContext context, required String email})
      : super(context: context, email: email, password: "", verifyPassword: "");
}

class ChangePassword extends SignupEvent {
  const ChangePassword(
      {required BuildContext context, required String password})
      : super(
            context: context,
            password: password,
            email: "",
            verifyPassword: "");
}

class ChangeVerifyPassword extends SignupEvent {
  const ChangeVerifyPassword(
      {required BuildContext context, required String verifyPassword})
      : super(
            context: context,
            verifyPassword: verifyPassword,
            email: "",
            password: "");
}

class SubmitSignUp extends SignupEvent {
  const SubmitSignUp({required BuildContext context})
      : super(context: context, email: "", password: "", verifyPassword: "");
}
