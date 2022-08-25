import 'package:carrot_app/bloc/app_bloc.dart' as app;
import 'package:carrot_app/constants/app_colors.dart';
import 'package:carrot_app/constants/app_doubles.dart';
import 'package:carrot_app/constants/app_font_weights.dart';
import 'package:carrot_app/constants/app_icons.dart';
import 'package:carrot_app/models/product/product.dart';
import 'package:carrot_app/views/category_page/bloc/category_bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';

/// Button that floats over the category item in the [CategoryPage]
class AddToCartButton extends StatelessWidget {
  final Product product;
  const AddToCartButton(this.product, {key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Listen to AppState in order to get the products in the user's cart
    return BlocBuilder<app.AppBloc, app.AppState>(
      builder: (context, state) {
        if (state.products.indexWhere((element) => element.id == product.id) ==
            -1) {
          // * item not in cart
          return Container(
            width: AppDoubles.squareAddToCartButton,
            height: AppDoubles.squareAddToCartButton,
            decoration: BoxDecoration(
              color: AppColors.white,
              boxShadow: [
                BoxShadow(
                  color: AppColors.lightGreen,
                  blurRadius: AppDoubles.cartButtonBlurRadius,
                  spreadRadius: AppDoubles.noSpread,
                ),
              ],
            ),
            child: IconButton(
              color: AppColors.white,
              onPressed: () {
                BlocProvider.of<CategoryBloc>(context)
                    .add(AddToCart(product: product, context: context));
              },
              icon: Align(
                alignment: Alignment.centerLeft,
                child: Icon(
                  AppIcons.addToCart,
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
              width: AppDoubles.squareAddToCartButton,
              height: AppDoubles.squareAddToCartButton,
              decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(
                      blurRadius: AppDoubles.cartButtonBlurRadius,
                      color: AppColors.lightGreen)
                ],
                color: AppColors.white,
              ),
              child: IconButton(
                  splashColor: AppColors.noSplashIconButtonColor,
                  color: Theme.of(context).primaryColor,
                  iconSize: AppDoubles.floatingCartButtonSize,
                  onPressed: () {
                    BlocProvider.of<CategoryBloc>(context).add(
                        RemoveFromCart(product: product, context: context));
                  },
                  icon: const Icon(AppIcons.removeFromCart)),
            ),
            // * Item quantity in cart
            Container(
              width: AppDoubles.squareAddToCartText,
              height: AppDoubles.squareAddToCartText,
              color: Theme.of(context).primaryColor,
              child: Center(
                child: Text(
                  state.products
                      .firstWhere((element) => element.id == product.id)
                      .quantity
                      .toString(),
                  style: const TextStyle(
                      color: AppColors.white,
                      fontSize: AppDoubles.floatingCartButtonSize,
                      fontWeight: AppFontWeights.bold),
                ),
              ),
            ),
            // * Add one to cart Button
            Container(
              width: AppDoubles.squareAddToCartButton,
              height: AppDoubles.squareAddToCartButton,
              decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(
                      blurRadius: AppDoubles.cartButtonBlurRadius,
                      color: AppColors.lightGreen)
                ],
                color: AppColors.white,
              ),
              child: IconButton(
                splashColor: AppColors.noSplashIconButtonColor,
                color: Theme.of(context).primaryColor,
                iconSize: AppDoubles.floatingCartButtonSize,
                onPressed: () {
                  BlocProvider.of<CategoryBloc>(context)
                      .add(AddToCart(product: product, context: context));
                },
                icon: const Icon(AppIcons.addToCart),
              ),
            )
          ],
        );
      },
    );
  }
}
