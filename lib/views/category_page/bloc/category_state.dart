part of 'category_bloc.dart';

abstract class CategoryState extends Equatable {
  const CategoryState();

  @override
  List<Object?> get props => [];
}

class CategoryInitial extends CategoryState {}

class CategoryChanged extends CategoryState {
  final int changedIndex;
  final int count;

  const CategoryChanged(this.changedIndex, this.count);

  @override
  List<Object> get props => [changedIndex, count];
}

class AnimationDone extends CategoryState {}
