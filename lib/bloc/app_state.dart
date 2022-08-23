part of 'app_bloc.dart';

abstract class AppState extends Equatable {
  const AppState({required this.user, required this.products});
  final List<Product> products;
  final UserModel user;

  @override
  List<Object> get props => [];
}

class AppInitial extends AppState {
  const AppInitial({required UserModel user, required List<Product> products})
      : super(user: user, products: products);
}

class UserLoggedIn extends AppState {
  const UserLoggedIn({required UserModel user, required List<Product> products})
      : super(user: user, products: products);
}

class AddingToCart extends AppState {
  const AddingToCart({required UserModel user, required List<Product> products})
      : super(user: user, products: products);
}

class AddedToCart extends AppState {
  const AddedToCart({required UserModel user, required List<Product> products})
      : super(user: user, products: products);
}

class RemovedFromCart extends AppState {
  const RemovedFromCart(
      {required UserModel user, required List<Product> products})
      : super(user: user, products: products);
}

class CartSet extends AppState {
  const CartSet({required UserModel user, required List<Product> products})
      : super(user: user, products: products);
}

class ErrorOccurred extends AppState {
  final String message;
  const ErrorOccurred(this.message,
      {required UserModel user, required List<Product> products})
      : super(user: user, products: products);
}
