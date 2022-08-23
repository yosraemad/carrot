import 'package:carrot_app/bloc/app_bloc.dart';
import 'package:carrot_app/models/product/product.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';

/// Button that floats over the category item in the [CategoryPage]
class AddToCartButton extends StatelessWidget {
  final Product product;
  const AddToCartButton(this.product, {key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Listen to AppState in order to get the products in the user's cart
    return BlocBuilder<AppBloc, AppState>(
      builder: (context, state) {
        if (state.products.indexWhere((element) => element.id == product.id) ==
            -1) {
          // * item not in cart
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
                BlocProvider.of<AppBloc>(context).add(AddToCart(product));
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
        // * item in cart
        return Column(
          children: [
            // * Remove one from cart button
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
                    BlocProvider.of<AppBloc>(context)
                        .add(RemoveFromCart(product));
                  },
                  icon: const Icon(Icons.remove)),
            ),
            // * Item quantity in cart
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
            // * Add one to cart Button
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
                  BlocProvider.of<AppBloc>(context).add(AddToCart(product));
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
