import 'package:carrot_app/bloc/app_bloc.dart';
import 'package:carrot_app/models/product/product.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Utils {
  // returns total price of the user's cart
  static double getTotalPrice(BuildContext context) {
    List<Product> products =
        BlocProvider.of<AppBloc>(context, listen: true).state.products;
    double total = 0;
    for (int i = 0; i < products.length; i++) {
      total += products[i].total;
    }
    return total;
  }
}
