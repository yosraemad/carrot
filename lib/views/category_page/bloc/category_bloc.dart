import 'package:bloc/bloc.dart';
import 'package:carrot_app/bloc/app_bloc.dart' as app;
import 'package:carrot_app/models/product/product.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'category_event.dart';
part 'category_state.dart';

class CategoryBloc extends Bloc<CategoryEvent, CategoryState> {
  CategoryBloc() : super(const CategoryInitial(-1, -1)) {
    on<AddToCart>((event, emit) {
      BlocProvider.of<app.AppBloc>(event.context!)
          .add(app.AddToCart(event.product!));
      emit(CategoryChanged(event.product!.id, event.product!.quantity));
    });

    on<RemoveFromCart>((event, emit) {
      BlocProvider.of<app.AppBloc>(event.context!)
          .add(app.RemoveFromCart(event.product!));
      emit(CategoryChanged(event.product!.id, event.product!.quantity));
    });
    on<EndAnimation>((event, emit) {
      emit(AnimationDone(state.changedIndex, state.count));
    });
  }
}
