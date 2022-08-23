part of 'home_bloc.dart';

abstract class HomeState extends Equatable {
  const HomeState(this.index, {required this.appBar});
  final int index;
  final PreferredSizeWidget? appBar;

  @override
  List<Object> get props => [index];
}

class HomeInitial extends HomeState {
  const HomeInitial(int index, {required PreferredSizeWidget? appBar})
      : super(index, appBar: appBar);
}

class NewHomeIndex extends HomeState {
  const NewHomeIndex(int index, {required PreferredSizeWidget? appBar})
      : super(index, appBar: appBar);
}
