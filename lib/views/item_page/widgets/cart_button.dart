import 'package:carrot_app/bloc/app_bloc.dart';
import 'package:carrot_app/resources/app_colors.dart';
import 'package:carrot_app/resources/app_doubles.dart';
import 'package:carrot_app/resources/app_font_weights.dart';
import 'package:carrot_app/resources/app_icons.dart';
import 'package:carrot_app/resources/app_strings.dart';
import 'package:carrot_app/models/product/product.dart';
import 'package:carrot_app/widgets/cart_button/add_to_cart.dart';
import 'package:carrot_app/widgets/cart_button/quantity_text.dart';
import 'package:carrot_app/widgets/cart_button/remove_from_cart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CartButton extends StatelessWidget {
  const CartButton(this.product, {key}) : super(key: key);
  final Product product;

  @override
  Widget build(BuildContext context) {
    // * using bloc builder here to listen to changes to the cart
    // * regarding the item the user is currently viewing

    AppBloc appBloc = BlocProvider.of<AppBloc>(context, listen: true);
    return Builder(
      builder: (context) {
        if (appBloc.products
                .indexWhere((element) => element.id == product.id) ==
            -1) {
          // if the product is not in the cart
          return Padding(
            padding: const EdgeInsets.all(AppDoubles.cartButtonPadding),
            child: SizedBox(
              width: double.infinity,
              height: AppDoubles.cartButtonHeight,
              child: ElevatedButton(
                style:
                    ElevatedButton.styleFrom(elevation: AppDoubles.noElevation),
                onPressed: () {
                  // notify app bloc with the new item added to cart
                  BlocProvider.of<AppBloc>(context).add(AddToCart(product));
                },
                child: const Text(
                  AppStrings.addToCartText,
                  style: TextStyle(
                    color: AppColors.formButtonTextColor,
                    fontWeight: FontWeight.bold,
                    fontSize: AppDoubles.formButtonFontSize,
                  ),
                ),
              ),
            ),
          );
        } else {
          // if the product is in the cart
          return Padding(
            padding:
                const EdgeInsets.only(bottom: AppDoubles.cartButtonPadding),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // * remove one from cart button
                RemoveFromCartButton(product),
                // * Product Quantity Text
                QuantityText(
                  quantity: appBloc.products
                      .firstWhere((element) => element.id == product.id)
                      .quantity
                      .toString(),
                  product: product,
                  width: AppDoubles.quantityTextWidth,
                  height: AppDoubles.quantityTextHeight,
                  fontSize: AppDoubles.bigFontSize,
                ),
                // * add one to cart button
                AddToCartButton(product: product)
              ],
            ),
          );
        }
      },
    );
  }
}
