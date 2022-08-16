part of 'user_bloc.dart';

abstract class UserState extends Equatable {
  const UserState(this.user);
  final UserModel user;

  @override
  List<Object> get props => [user, user.cart, user.cart.length];
}

class UserInitial extends UserState {
  const UserInitial(super.user);
}

class UserSignedIn extends UserState {
  const UserSignedIn(super.user);
}

class UserChangingCart extends UserState {
  const UserChangingCart(super.user);
}

class UserAddedToCart extends UserState {
  const UserAddedToCart(super.user);
}

class UserRemovedFromCart extends UserState {
  const UserRemovedFromCart(super.user);
}
