import 'package:bloc/bloc.dart';
import 'package:carrot_app/models/user/user.dart';
import 'package:equatable/equatable.dart';

part 'app_event.dart';
part 'app_state.dart';

class AppBloc extends Bloc<AppEvent, AppState> {
  AppBloc() : super(const AppInitial(user: UserModel("", isLoggedIn: false))) {
    on<SignUp>((event, emit) async {
      emit(UserLoggedIn(user: UserModel(event.userId, isLoggedIn: true)));
    });

    on<SignIn>((event, emit) {
      emit(UserLoggedIn(user: UserModel(event.userId, isLoggedIn: true)));
    });
    on<SignOut>((event, emit) {
      emit(const AppInitial(user: UserModel("", isLoggedIn: false)));
    });
  }
}
