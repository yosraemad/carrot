import 'package:carrot_app/models/product/bloc/product_bloc.dart';
import 'package:carrot_app/models/user/bloc/user_bloc.dart';
import 'package:carrot_app/models/user/user.dart';
import 'package:carrot_app/views/cart_page/widgets/cart_page_item.dart';
import 'package:carrot_app/views/cart_page/widgets/checkout_button.dart';
import 'package:carrot_app/views/cart_page/widgets/empty_cart.dart';
import "package:flutter/material.dart";
import 'package:flutter_bloc/flutter_bloc.dart';

typedef GoHomeFunction = void Function();

class CartPage extends StatelessWidget {
  const CartPage({key, required this.goHome}) : super(key: key);

  final GoHomeFunction goHome;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProductBloc, ProductState>(
      builder: (context, state) {
        if (state.products.isEmpty) {
          return EmptyCart(goHome);
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
