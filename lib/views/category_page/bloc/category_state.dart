part of 'category_bloc.dart';

abstract class CategoryState extends Equatable {
  const CategoryState(this.changedIndex, this.count);
  final int changedIndex;
  final int count;

  @override
  List<Object> get props => [changedIndex, count];
}

class CategoryInitial extends CategoryState {
  const CategoryInitial(int changedIndex, int count)
      : super(changedIndex, count);
}

class CategoryChanged extends CategoryState {
  const CategoryChanged(int changedIndex, int count)
      : super(changedIndex, count);
}

class AnimationDone extends CategoryState {
  const AnimationDone(int changedIndex, int count) : super(changedIndex, count);
}
