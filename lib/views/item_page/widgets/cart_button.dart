import 'package:carrot_app/bloc/app_bloc.dart';
import 'package:carrot_app/models/product/product.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CartButton extends StatelessWidget {
  const CartButton(this.product, {key}) : super(key: key);
  final Product product;

  @override
  Widget build(BuildContext context) {
    // * using bloc builder here to listen to changes to the cart
    // * regarding the item the user is currently viewing
    return BlocBuilder<AppBloc, AppState>(
      builder: (context, state) {
        if (state.products.indexWhere((element) => element.id == product.id) ==
            -1) {
          // if the product is not in the cart
          return Padding(
            padding: const EdgeInsets.all(15.0),
            child: SizedBox(
              width: double.infinity,
              height: 50,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(elevation: 0),
                onPressed: () {
                  // notify app bloc with the new item added to cart
                  BlocProvider.of<AppBloc>(context).add(AddToCart(product));
                },
                child: const Text(
                  "Add to Cart",
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                  ),
                ),
              ),
            ),
          );
        } else {
          // if the product is in the cart
          return Padding(
            padding: const EdgeInsets.only(bottom: 15.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // * remove one from cart button
                Container(
                  decoration: BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                          blurRadius: 4.0,
                          color: const Color(0xff006f18).withAlpha(30))
                    ],
                    color: Colors.white,
                  ),
                  child: IconButton(
                      color: Theme.of(context).primaryColor,
                      onPressed: () {
                        // notify app bloc with the new item removed from cart
                        BlocProvider.of<AppBloc>(context)
                            .add(RemoveFromCart(product));
                      },
                      icon: const Icon(Icons.remove)),
                ),
                // * Product Quantity Text
                Container(
                  width: 70,
                  height: 50,
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
                // * add one to cart button
                Container(
                  decoration: BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                          blurRadius: 4.0,
                          color: const Color(0xff006f18).withAlpha(30))
                    ],
                    color: Colors.white,
                  ),
                  child: IconButton(
                    color: Theme.of(context).primaryColor,
                    onPressed: () {
                      // notify app bloc with the new item added to cart
                      BlocProvider.of<AppBloc>(context).add(AddToCart(product));
                    },
                    icon: const Icon(Icons.add),
                  ),
                )
              ],
            ),
          );
        }
      },
    );
  }
}
