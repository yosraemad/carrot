part of 'app_bloc.dart';

// define the states of the app wide bloc
abstract class AppState extends Equatable {
  const AppState();

  @override
  List<Object> get props => [];
}

class AppInitial extends AppState {}

class UserLoggedIn extends AppState {}

class AddingToCart extends AppState {}

class AddedToCart extends AppState {}

class RemovedFromCart extends AppState {}

class CartSet extends AppState {}

class ErrorOccurred extends AppState {
  final String message;
  const ErrorOccurred(this.message);

  @override
  List<Object> get props => [message];
}
