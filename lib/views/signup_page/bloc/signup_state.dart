part of 'signup_bloc.dart';

abstract class SignupState extends Equatable {
  const SignupState(
      {required this.email,
      required this.password,
      required this.verifyPassword});
  final String email;
  final String password;
  final String verifyPassword;

  @override
  List<Object> get props => [];
}

class SignupInitial extends SignupState {
  const SignupInitial(
      {required String email,
      required String password,
      required String verifyPassword})
      : super(email: email, password: password, verifyPassword: verifyPassword);
}

class ChangedFields extends SignupState {
  const ChangedFields(
      {required String email,
      required String password,
      required String verifyPassword})
      : super(email: email, password: password, verifyPassword: verifyPassword);
}

class ConfirmSignup extends SignupState {
  const ConfirmSignup(
      {required String email,
      required String password,
      required String verifyPassword})
      : super(email: email, password: password, verifyPassword: verifyPassword);
}

class ErrorOccurred extends SignupState {
  const ErrorOccurred(
      {required String email,
      required String password,
      required String verifyPassword})
      : super(email: email, password: password, verifyPassword: verifyPassword);
}
