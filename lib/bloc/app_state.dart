part of 'app_bloc.dart';

// define the states of the app wide bloc
abstract class AppState extends Equatable {
  const AppState(
      {required this.user, required this.products, required this.cartSet});
  final List<Product> products;
  final UserModel user;
  final bool cartSet;

  @override
  List<Object> get props => [products];
}

class AppInitial extends AppState {
  const AppInitial(
      {required UserModel user,
      required List<Product> products,
      required bool cartSet})
      : super(user: user, products: products, cartSet: cartSet);
}

class UserLoggedIn extends AppState {
  const UserLoggedIn(
      {required UserModel user,
      required List<Product> products,
      required bool cartSet})
      : super(user: user, products: products, cartSet: cartSet);
}

class AddingToCart extends AppState {
  const AddingToCart(
      {required UserModel user,
      required List<Product> products,
      required bool cartSet})
      : super(user: user, products: products, cartSet: cartSet);
}

class AddedToCart extends AppState {
  const AddedToCart(
      {required UserModel user,
      required List<Product> products,
      required bool cartSet})
      : super(user: user, products: products, cartSet: cartSet);
}

class RemovedFromCart extends AppState {
  const RemovedFromCart(
      {required UserModel user,
      required List<Product> products,
      required bool cartSet})
      : super(user: user, products: products, cartSet: cartSet);
}

class CartSet extends AppState {
  const CartSet(
      {required UserModel user,
      required List<Product> products,
      required bool cartSet})
      : super(user: user, products: products, cartSet: cartSet);
}

class ErrorOccurred extends AppState {
  final String message;
  const ErrorOccurred(this.message,
      {required UserModel user,
      required List<Product> products,
      required bool cartSet})
      : super(user: user, products: products, cartSet: cartSet);

  @override
  List<Object> get props => [message];
}
