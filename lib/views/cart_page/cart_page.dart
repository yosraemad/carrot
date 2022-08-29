import 'package:carrot_app/bloc/app_bloc.dart' as app;
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
    app.AppBloc appBloc = BlocProvider.of<app.AppBloc>(context, listen: true);
    return Builder(
      builder: (context) {
        if (appBloc.products.isEmpty) {
          return const EmptyCart();
        }
        return Column(
          children: [
            Expanded(
              child: ListView.builder(
                itemCount: appBloc.products.length,
                itemBuilder: (context, index) {
                  return CartPageItem(appBloc.products[index]);
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
