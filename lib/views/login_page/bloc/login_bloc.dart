import 'package:bloc/bloc.dart';
import 'package:carrot_app/view_models/user_view_model.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

part 'login_event.dart';
part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  LoginBloc() : super(const LoginInitial(email: "", password: "")) {
    on<ChangeEmail>((event, emit) {
      emit(ChangedField(email: event.email, password: state.password));
      emit(LoginInitial(email: state.email, password: state.password));
    });
    on<ChangePassword>((event, emit) {
      emit(ChangedField(email: state.email, password: event.password));
      emit(LoginInitial(email: state.email, password: state.password));
    });
    on<SubmitLogin>((event, emit) async {
      bool success = await UserViewModel()
          .signInUser(event.context, state.email, state.password);
      if (success) {
        emit(ConfirmSignIn(email: state.email, password: state.password));
      } else {
        emit(ErrorOccurred(email: state.email, password: state.password));
      }
    });
  }
}
