import 'package:carrot_app/bloc/app_bloc.dart';
import 'package:carrot_app/models/product/bloc/product_bloc.dart';
import 'package:carrot_app/models/product/product.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
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

  Future<bool> getUserProducts(BuildContext context) async {
    final appBloc = BlocProvider.of<AppBloc>(context, listen: true);
    final productBloc = BlocProvider.of<ProductBloc>(context);
    if (appBloc.state.user.id.isNotEmpty) {
      List<dynamic>? products = (await FirebaseFirestore.instance
              .collection("products")
              .doc(appBloc.state.user.id)
              .get())
          .data()?["products"];
      if (products != null) {
        productBloc
            .add(SetCart(products.map((e) => Product.fromJson(e)).toList()));
      }
    }
    return true;
  }

  void addToCart(Product product, BuildContext context) {
    final productBloc = BlocProvider.of<ProductBloc>(context);
    productBloc.add(AddToCart(product));
    _setProductsInDatabase(context);
  }

  Future<void> removeFromCart(Product product, BuildContext context) async {
    final productBloc = BlocProvider.of<ProductBloc>(context);
    productBloc.add(RemoveFromCart(product));
    _setProductsInDatabase(context);
  }

  _setProductsInDatabase(BuildContext context) async {
    final productBloc = BlocProvider.of<ProductBloc>(context);
    final appBloc = BlocProvider.of<AppBloc>(context);
    CollectionReference products =
        await FirebaseFirestore.instance.collection("products");
    await products.doc(appBloc.state.user.id).set({
      "id": appBloc.state.user.id,
      "products": productBloc.state.products.map((e) => e.toMap()).toList(),
    });
  }
}
