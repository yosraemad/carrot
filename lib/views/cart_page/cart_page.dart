import 'package:carrot_app/models/product/bloc/product_bloc.dart';
import 'package:carrot_app/models/user/bloc/user_bloc.dart';
import 'package:carrot_app/models/user/user.dart';
import 'package:carrot_app/views/cart_page/widgets/cart_page_item.dart';
import 'package:carrot_app/views/cart_page/widgets/checkout_button.dart';
import "package:flutter/material.dart";
import 'package:flutter_bloc/flutter_bloc.dart';

class CartPage extends StatelessWidget {
  const CartPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProductBloc, ProductState>(
      builder: (context, state) {
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
