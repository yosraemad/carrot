import 'package:carrot_app/bloc/app_bloc.dart';
import 'package:carrot_app/models/user/user.dart';
import 'package:carrot_app/views/cart_page/widgets/cart_page_item.dart';
import 'package:carrot_app/views/cart_page/widgets/checkout_button.dart';
import 'package:carrot_app/views/cart_page/widgets/empty_cart.dart';
import "package:flutter/material.dart";
import 'package:flutter_bloc/flutter_bloc.dart';

// Page that shows items inside the user's cart
class CartPage extends StatelessWidget {
  const CartPage({key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    // listen to app state to get the items inside the user's cart
    return BlocBuilder<AppBloc, AppState>(
      builder: (context, state) {
        if (state.products.isEmpty) {
          return EmptyCart();
        }
        return Column(
          children: [
            Expanded(
              child: ListView.builder(
                itemCount: state.products.length,
                itemBuilder: (context, index) {
                  return CartPageItem(state.products[index]);
                },
              ),
            ),
            const CheckoutButton(),
          ],
        );
      },
    );
  }
}
