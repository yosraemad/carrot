import 'package:bloc/bloc.dart';
import 'package:carrot_app/bloc/app_bloc.dart';
import 'package:carrot_app/constants/app_strings.dart';
import 'package:carrot_app/services/auth_service.dart';
import 'package:carrot_app/utils/firebase_exception.dart';
import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'signup_event.dart';
part 'signup_state.dart';

class SignupBloc extends Bloc<SignupEvent, SignupState> {
  SignupBloc()
      : super(
            const SignupInitial(email: "", password: "", verifyPassword: "")) {
    on<ChangeEmail>((event, emit) {
      emit(ChangedFields(
          email: event.email,
          password: state.password,
          verifyPassword: state.verifyPassword));
      emit(SignupInitial(
          email: state.email,
          password: state.password,
          verifyPassword: state.password));
    });
    on<ChangePassword>((event, emit) {
      emit(ChangedFields(
          email: state.email,
          password: event.password,
          verifyPassword: state.verifyPassword));
      emit(SignupInitial(
          email: state.email,
          password: state.password,
          verifyPassword: state.password));
    });
    on<ChangeVerifyPassword>((event, emit) {
      emit(ChangedFields(
          email: state.email,
          password: state.password,
          verifyPassword: event.verifyPassword));
      emit(SignupInitial(
          email: state.email,
          password: state.password,
          verifyPassword: state.password));
    });
    on<SubmitSignUp>((event, emit) async {
      emit(SignUpPressed(
          email: state.email,
          password: state.password,
          verifyPassword: state.verifyPassword));
      try {
        // Sign Up user in Firebase
        User? user = await AuthService.signUpUser(state.email, state.password);
        if (user == null) {
          emit(ErrorOccurred(AppStrings.errorText,
              email: state.email,
              password: state.password,
              verifyPassword: state.verifyPassword));
        } else {
          // ! Pop the sign up page because it is on top of the log in page in the stack.
          // ! When the firebase auth changes there is a stream builder that changes the
          // ! screen beneath the sign up page and it won't be shown without popping the
          // ! sign up page
          Navigator.pop(event.context);
          // * update the app bloc with the user id
          event.context.read<AppBloc>().add(SignUp(userId: user.uid));
          emit(ConfirmSignup(
              email: state.email,
              password: state.password,
              verifyPassword: state.verifyPassword));
        }
      } on AppException catch (exception, _) {
        emit(ErrorOccurred(exception.toString(),
            email: state.email,
            password: state.password,
            verifyPassword: state.verifyPassword));
      }
    });
  }
}
