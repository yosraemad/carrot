import 'package:bloc/bloc.dart';
import 'package:carrot_app/view_models/user_view_model.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';

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
      bool success = await UserViewModel()
          .createUser(event.context, state.email, state.password);
      if (success) {
        Navigator.pop(event.context);
        emit(ConfirmSignup(
            email: state.email,
            password: state.password,
            verifyPassword: state.verifyPassword));
      } else {
        emit(ErrorOccurred(
            email: state.email,
            password: state.password,
            verifyPassword: state.verifyPassword));
      }
    });
  }
}
