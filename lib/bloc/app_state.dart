part of 'app_bloc.dart';

abstract class AppState extends Equatable {
  const AppState({required this.user});
  final UserModel user;

  @override
  List<Object> get props => [];
}

class AppInitial extends AppState {
  const AppInitial({required UserModel user}) : super(user: user);
}

class UserLoggedIn extends AppState {
  const UserLoggedIn({required UserModel user}) : super(user: user);
}
