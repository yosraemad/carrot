import 'package:carrot_app/bloc/app_bloc.dart' as app;
import 'package:carrot_app/constants/app_doubles.dart';
import 'package:carrot_app/models/product/product.dart';
import 'package:carrot_app/widgets/cart_button/add_to_cart.dart' as plus_button;
import 'package:carrot_app/widgets/cart_button/quantity_text.dart';
import 'package:carrot_app/widgets/cart_button/remove_from_cart.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';

/// Button that floats over the category item in the [CategoryPage]
class AddToCartButton extends StatelessWidget {
  final Product product;
  const AddToCartButton(this.product, {key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Listen to AppState in order to get the products in the user's cart
    app.AppBloc appBloc = BlocProvider.of<app.AppBloc>(context, listen: true);
    return Builder(
      builder: (context) {
        if (appBloc.products
                .indexWhere((element) => element.id == product.id) ==
            -1) {
          // * item not in cart
          return plus_button.AddToCartButton(
            product: product,
            width: AppDoubles.squareAddToCartButton,
            height: AppDoubles.squareAddToCartButton,
          );
        }
        // * item in cart
        return Column(
          children: [
            // * Remove one from cart button
            RemoveFromCartButton(
              product,
              width: AppDoubles.squareAddToCartButton,
              height: AppDoubles.squareAddToCartButton,
              iconSize: AppDoubles.floatingCartButtonSize,
            ),
            // * Item quantity in cart
            QuantityText(
              quantity: appBloc.products
                  .firstWhere((element) => element.id == product.id)
                  .quantity
                  .toString(),
              product: product,
              width: AppDoubles.squareAddToCartText,
              height: AppDoubles.squareAddToCartText,
              fontSize: AppDoubles.floatingCartButtonSize,
            ),
            // * Add one to cart Button
            plus_button.AddToCartButton(
              product: product,
              width: AppDoubles.squareAddToCartButton,
              height: AppDoubles.squareAddToCartButton,
              iconSize: AppDoubles.floatingCartButtonSize,
            ),
          ],
        );
      },
    );
  }
}
