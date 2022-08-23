part of 'app_bloc.dart';

abstract class AppEvent extends Equatable {
  const AppEvent();

  @override
  List<Object> get props => [];
}

class SignIn extends AppEvent {
  final String userId;

  const SignIn({required this.userId});

  @override
  List<Object> get props => [userId];
}

class SignUp extends AppEvent {
  final String userId;

  const SignUp({required this.userId});

  @override
  List<Object> get props => [userId];
}

class SignOut extends AppEvent {
  const SignOut();
}

class AddToCart extends AppEvent {
  final Product product;

  const AddToCart(this.product);

  @override
  List<Object> get props => [product];
}

class RemoveFromCart extends AppEvent {
  final Product product;
  const RemoveFromCart(this.product);

  @override
  List<Object> get props => [product];
}

class SetCart extends AppEvent {
  const SetCart();

  @override
  List<Object> get props => [];
}
