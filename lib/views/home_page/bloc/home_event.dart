part of 'home_bloc.dart';

// define the events for the home page bloc
abstract class HomeEvent extends Equatable {
  const HomeEvent(this.newIndex);
  final int newIndex;

  @override
  List<Object> get props => [newIndex];
}

class ChangeIndex extends HomeEvent {
  const ChangeIndex(int newIndex) : super(newIndex);
}
