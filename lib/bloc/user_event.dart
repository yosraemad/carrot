part of 'user_bloc.dart';

abstract class UserEvent extends Equatable {
  const UserEvent();

  @override
  List<Object> get props => [];
}

class SignIn extends UserEvent {
  final String userId;

  const SignIn({required this.userId});

  @override
  List<Object> get props => [userId];
}

class SignUp extends UserEvent {
  final String userId;

  const SignUp({required this.userId});

  @override
  List<Object> get props => [userId];
}

class AddToCart extends UserEvent {
  final Product product;

  const AddToCart(this.product);

  @override
  List<Object> get props => [product];
}

class RemoveFromCart extends UserEvent {
  final Product product;
  const RemoveFromCart(this.product);

  @override
  List<Object> get props => [product];
}
