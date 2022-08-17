import 'package:carrot_app/models/product/bloc/product_bloc.dart';
import 'package:carrot_app/models/product/product.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProductViewModel {
  double getTotalPrice(BuildContext context) {
    List<Product> products =
        BlocProvider.of<ProductBloc>(context, listen: true).state.products;
    double total = 0;
    for (int i = 0; i < products.length; i++) {
      total += products[i].total;
    }
    return total;
  }
}
