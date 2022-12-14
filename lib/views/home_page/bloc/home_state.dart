part of 'home_bloc.dart';

// define state for the home page bloc
abstract class HomeState extends Equatable {
  const HomeState(this.index);
  final int index;

  @override
  List<Object> get props => [index];
}

class HomeInitial extends HomeState {
  const HomeInitial(int index) : super(index);
}

class NewHomeIndex extends HomeState {
  const NewHomeIndex(int index) : super(index);
}

class AllProductsSet extends HomeState {
  const AllProductsSet(int index) : super(index);
}

class ErrorOccurred extends HomeState {
  final String message;
  const ErrorOccurred(int index, {required this.message}) : super(index);
}
