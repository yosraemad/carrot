import 'package:carrot_app/bloc/app_bloc.dart';
import 'package:carrot_app/constants/app_colors.dart';
import 'package:carrot_app/constants/app_doubles.dart';
import 'package:carrot_app/constants/app_font_weights.dart';
import 'package:carrot_app/constants/app_icons.dart';
import 'package:carrot_app/constants/app_strings.dart';
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
                Container(
                  decoration: BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                          blurRadius: AppDoubles.cartButtonBlurRadius,
                          color: AppColors.lightGreen)
                    ],
                    color: AppColors.formButtonTextColor,
                  ),
                  child: IconButton(
                      color: Theme.of(context).primaryColor,
                      onPressed: () {
                        // notify app bloc with the new item removed from cart
                        BlocProvider.of<AppBloc>(context)
                            .add(RemoveFromCart(product));
                      },
                      icon: const Icon(AppIcons.removeFromCart)),
                ),
                // * Product Quantity Text
                Container(
                  width: AppDoubles.quantityTextWidth,
                  height: AppDoubles.quantityTextHeight,
                  color: Theme.of(context).primaryColor,
                  child: Center(
                    child: Text(
                      state.products
                          .firstWhere((element) => element.id == product.id)
                          .quantity
                          .toString(),
                      style: const TextStyle(
                          color: AppColors.formButtonTextColor,
                          fontSize: AppDoubles.bigFontSize,
                          fontWeight: AppFontWeights.itemPageFontWeight),
                    ),
                  ),
                ),
                // * add one to cart button
                Container(
                  decoration: BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                          blurRadius: AppDoubles.cartButtonBlurRadius,
                          color: AppColors.lightGreen)
                    ],
                    color: AppColors.formButtonTextColor,
                  ),
                  child: IconButton(
                    color: Theme.of(context).primaryColor,
                    onPressed: () {
                      // notify app bloc with the new item added to cart
                      BlocProvider.of<AppBloc>(context).add(AddToCart(product));
                    },
                    icon: const Icon(AppIcons.addToCart),
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
