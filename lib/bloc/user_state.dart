part of 'user_bloc.dart';

abstract class UserState extends Equatable {
  const UserState();

  @override
  List<Object> get props => [];
}

class UserInitial extends UserState {
  final UserModel user = const UserModel("", isLoggedIn: false, cart: []);
}

class UserSignedIn extends UserState {
  final UserModel user;

  const UserSignedIn({required this.user});

  @override
  List<Object> get props => [user];
}
