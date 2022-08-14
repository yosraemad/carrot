import 'package:bloc/bloc.dart';
import 'package:carrot_app/models/product.dart';
import 'package:carrot_app/models/user.dart';
import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart';

part 'user_event.dart';
part 'user_state.dart';

final FirebaseAuth _auth = FirebaseAuth.instance;

class UserBloc extends Bloc<UserEvent, UserState> {
  UserBloc() : super(UserInitial()) {
    on<SignUp>((event, emit) async {
      emit(UserSignedIn(
          user: UserModel(event.userId, isLoggedIn: true, cart: const [])));
    });

    on<SignIn>((event, emit) {});

    on<AddToCart>((event, emit) {});

    on<RemoveFromCart>((event, emit) {});
  }
}
