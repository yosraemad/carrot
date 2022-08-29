part of 'home_bloc.dart';

// define the events for the home page bloc
abstract class HomeEvent extends Equatable {
  const HomeEvent();

  @override
  List<Object?> get props => [];
}

class ChangeIndex extends HomeEvent {
  final int newIndex;
  const ChangeIndex(this.newIndex);

  @override
  List<Object> get props => [newIndex];
}

class GetAllProducts extends HomeEvent {}
