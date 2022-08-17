import 'package:carrot_app/models/product/bloc/product_bloc.dart';
import 'package:carrot_app/models/product/product.dart';
import 'package:carrot_app/models/user/bloc/user_bloc.dart';
import 'package:carrot_app/view_models/product_view_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';

class AddToCartButton extends StatelessWidget {
  final Product product;
  const AddToCartButton(this.product, {super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProductBloc, ProductState>(
      builder: (context, state) {
        if (state.products.indexWhere((element) => element.id == product.id) ==
            -1) {
          return Container(
            width: 40,
            height: 40,
            decoration: BoxDecoration(
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                  color: const Color(0xff006f18).withAlpha(25),
                  blurRadius: 4.0,
                  spreadRadius: 0.0,
                ),
              ],
            ),
            child: IconButton(
              color: Colors.white,
              onPressed: () {
                ProductViewModel().addToCart(product, context);
              },
              icon: Align(
                alignment: Alignment.centerLeft,
                child: Icon(
                  Icons.add,
                  color: Theme.of(context).primaryColor,
                ),
              ),
            ),
          );
        }

        return Column(
          children: [
            Container(
              width: 40,
              height: 41,
              decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(
                      blurRadius: 4.0,
                      color: const Color(0xff006f18).withAlpha(30))
                ],
                color: Colors.white,
              ),
              child: IconButton(
                  splashColor: Colors.transparent,
                  color: Theme.of(context).primaryColor,
                  iconSize: 20,
                  onPressed: () {
                    ProductViewModel().removeFromCart(product, context);
                  },
                  icon: const Icon(Icons.remove)),
            ),
            Container(
              width: 34,
              height: 35,
              color: Theme.of(context).primaryColor,
              child: Center(
                child: Text(
                  state.products
                      .firstWhere((element) => element.id == product.id)
                      .quantity
                      .toString(),
                  style: const TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.bold),
                ),
              ),
            ),
            Container(
              width: 40,
              height: 41,
              decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(
                      blurRadius: 4.0, color: Color(0xff006f18).withAlpha(30))
                ],
                color: Colors.white,
              ),
              child: IconButton(
                splashColor: Colors.transparent,
                color: Theme.of(context).primaryColor,
                iconSize: 20,
                onPressed: () {
                  ProductViewModel().addToCart(product, context);
                },
                icon: const Icon(Icons.add),
              ),
            )
          ],
        );
      },
    );
  }
}
