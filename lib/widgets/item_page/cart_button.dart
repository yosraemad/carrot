import 'package:carrot_app/bloc/user_bloc.dart';
import 'package:carrot_app/models/product.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CartButton extends StatelessWidget {
  const CartButton(this.product, {super.key});
  final Product product;

  @override
  Widget build(BuildContext context) {
    final userBloc = BlocProvider.of<UserBloc>(context, listen: true);
    return BlocBuilder<UserBloc, UserState>(
      builder: (context, state) {
        if (state.user.cart.indexWhere((element) => element.id == product.id) ==
            -1) {
          return Padding(
            padding: const EdgeInsets.all(15.0),
            child: SizedBox(
              width: double.infinity,
              height: 50,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(elevation: 0),
                onPressed: () {
                  userBloc.add(AddToCart(product));
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
          return Padding(
            padding: const EdgeInsets.only(bottom: 15.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
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
                        userBloc.add(RemoveFromCart(product));
                      },
                      icon: const Icon(Icons.remove)),
                ),
                Container(
                  width: 70,
                  height: 50,
                  color: Theme.of(context).primaryColor,
                  child: Center(
                    child: Text(
                      state.user.cart
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
                  decoration: BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                          blurRadius: 4.0,
                          color: Color(0xff006f18).withAlpha(30))
                    ],
                    color: Colors.white,
                  ),
                  child: IconButton(
                    color: Theme.of(context).primaryColor,
                    onPressed: () {
                      userBloc.add(AddToCart(product));
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
