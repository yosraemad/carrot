part of 'login_bloc.dart';

// defining events of the login bloc
abstract class LoginEvent extends Equatable {
  const LoginEvent(
      {required this.context, required this.email, required this.password});

  final BuildContext context;
  final String email;
  final String password;

  @override
  List<Object> get props => [];
}

class ChangeEmail extends LoginEvent {
  const ChangeEmail({required BuildContext context, required String email})
      : super(context: context, email: email, password: "");
}

class ChangePassword extends LoginEvent {
  const ChangePassword(
      {required BuildContext context, required String password})
      : super(
          context: context,
          password: password,
          email: "",
        );
}

class SubmitLogin extends LoginEvent {
  const SubmitLogin({required BuildContext context})
      : super(context: context, email: "", password: "");
}
