import 'package:bloc/bloc.dart';
import 'package:carrot_app/bloc/app_bloc.dart' as app;
import 'package:carrot_app/models/product/product.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'category_event.dart';
part 'category_state.dart';

class CategoryBloc extends Bloc<CategoryEvent, CategoryState> {
  int changedIndex = -1;
  int count = -1;
  CategoryBloc() : super(CategoryInitial()) {
    on<AddToCart>((event, emit) {
      BlocProvider.of<app.AppBloc>(event.context!)
          .add(app.AddToCart(event.product!));
      changedIndex = event.product!.id;
      count = event.product!.quantity;
      emit(CategoryChanged(event.product!.id, event.product!.quantity));
    });

    on<RemoveFromCart>((event, emit) {
      BlocProvider.of<app.AppBloc>(event.context!)
          .add(app.RemoveFromCart(event.product!));
      changedIndex = event.product!.id;
      count = event.product!.quantity;
      emit(CategoryChanged(event.product!.id, event.product!.quantity));
    });
    on<EndAnimation>((event, emit) {
      emit(AnimationDone());
    });
  }
}
