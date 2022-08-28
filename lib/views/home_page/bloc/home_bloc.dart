import 'package:bloc/bloc.dart';
import 'package:carrot_app/bloc/app_bloc.dart';
import 'package:carrot_app/models/product/product.dart';
import 'package:carrot_app/resources/app_doubles.dart';
import 'package:carrot_app/services/firestore_service.dart';
import 'package:carrot_app/utils/firebase_exception.dart';
import 'package:carrot_app/views/cart_page/widgets/cart_appbar.dart';
import 'package:carrot_app/views/home_page/widgets/home_appbar.dart';
import 'package:carrot_app/views/profile_page/widgets/profile_page_appbar.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  PreferredSizeWidget? appBar = const HomeAppBar();
  List allProducts = [];
  bool allProductsSet = false;
  HomeBloc() : super(const HomeInitial(0)) {
    on<ChangeIndex>((event, emit) {
      if (event.newIndex == AppDoubles.cartPageIndex) {
        // Cart Page is chosen
        appBar = const CartAppBar();
        emit(NewHomeIndex(event.newIndex));
      } else if (event.newIndex == AppDoubles.profilePageIndex) {
        // Profile Page is chosen
        appBar = const ProfilePageAppBar();
        emit(NewHomeIndex(event.newIndex));
      } else {
        appBar = const HomeAppBar();
        emit(NewHomeIndex(event.newIndex));
      }
    });
    on<GetAllProducts>((event, emit) async {
      try {
        allProducts = await FirestoreService.getAllProducts();
        allProductsSet = true;
        emit(AllProductsSet(state.index));
      } on AppException catch (exception, stackTrace) {
        emit(ErrorOccurred(state.index, message: exception.message));
      }
    });
  }
}
