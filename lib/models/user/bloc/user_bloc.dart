import 'package:bloc/bloc.dart';
import 'package:carrot_app/models/product/product.dart';
import 'package:carrot_app/models/user/user.dart';
import 'package:equatable/equatable.dart';

part 'user_event.dart';
part 'user_state.dart';

class UserBloc extends Bloc<UserEvent, UserState> {
  UserBloc() : super(UserInitial(UserModel("", isLoggedIn: false))) {
    on<SignUp>((event, emit) async {
      emit(UserSignedIn(UserModel(event.userId, isLoggedIn: true)));
    });

    on<SignIn>((event, emit) {
      emit(UserSignedIn(UserModel(event.userId, isLoggedIn: true)));
    });
    on<SignOut>((event, emit) {
      emit(UserInitial(UserModel("", isLoggedIn: false)));
    });
  }
}
