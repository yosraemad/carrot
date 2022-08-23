part of 'login_bloc.dart';

// defining states of the login bloc
abstract class LoginState extends Equatable {
  const LoginState({required this.email, required this.password});
  final String email;
  final String password;

  @override
  List<Object> get props => [];
}

class LoginInitial extends LoginState {
  const LoginInitial({required String email, required String password})
      : super(email: email, password: password);
}

class ChangedField extends LoginState {
  const ChangedField({required String email, required String password})
      : super(email: email, password: password);
}

class ConfirmSignIn extends LoginState {
  const ConfirmSignIn({required String email, required String password})
      : super(email: email, password: password);
}

class ErrorOccurred extends LoginState {
  final String message;
  const ErrorOccurred(this.message,
      {required String email, required String password})
      : super(email: email, password: password);
}
