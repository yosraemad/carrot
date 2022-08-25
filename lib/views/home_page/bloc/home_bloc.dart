import 'package:bloc/bloc.dart';
import 'package:carrot_app/constants/app_doubles.dart';
import 'package:carrot_app/views/cart_page/widgets/cart_appbar.dart';
import 'package:carrot_app/views/home_page/widgets/home_appbar.dart';
import 'package:carrot_app/views/profile_page/widgets/profile_page_appbar.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  PreferredSizeWidget? appBar = const HomeAppBar();
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
  }
}
