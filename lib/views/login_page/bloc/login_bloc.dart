import 'package:bloc/bloc.dart';
import 'package:carrot_app/bloc/app_bloc.dart';
import 'package:carrot_app/services/auth_service.dart';
import 'package:carrot_app/utils/firebase_exception.dart';
import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

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
      try {
        User? user = await AuthService.signInUser(state.email, state.password);
        if (user == null) {
          emit(ErrorOccurred("An error occurred",
              email: state.email, password: state.password));
        } else {
          event.context.read<AppBloc>().add(SignIn(userId: user.uid));
          emit(ConfirmSignIn(email: state.email, password: state.password));
        }
      } on AppException catch (exception, _) {
        emit(ErrorOccurred(exception.toString(),
            email: state.email, password: state.password));
      }
    });
  }
}
