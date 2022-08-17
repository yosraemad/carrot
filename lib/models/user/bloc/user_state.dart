part of 'user_bloc.dart';

abstract class UserState extends Equatable {
  const UserState(this.user);
  final UserModel user;

  @override
  List<Object> get props => [user];
}

class UserInitial extends UserState {
  const UserInitial(super.user);
}

class UserSignedIn extends UserState {
  const UserSignedIn(super.user);
}
