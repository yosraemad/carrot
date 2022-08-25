import 'package:carrot_app/bloc/app_bloc.dart';
import 'package:carrot_app/constants/app_colors.dart';
import 'package:carrot_app/constants/app_doubles.dart';
import 'package:carrot_app/constants/app_font_weights.dart';
import 'package:carrot_app/constants/app_icons.dart';
import 'package:carrot_app/models/product/product.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

/// ListTile of one item in the cart
/// @param product: a product inside the cart
class CartPageItem extends StatelessWidget {
  final Product product;
  const CartPageItem(this.product, {key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(AppDoubles.cartItemPadding),
          child: ListTile(
            visualDensity: const VisualDensity(
                vertical: AppDoubles.cartItemVerticalDensity),
            leading: Container(
              padding: const EdgeInsets.all(AppDoubles.cartItemImagePadding),
              decoration: BoxDecoration(
                  border: Border.all(color: AppColors.grayishWhite),
                  borderRadius: BorderRadius.circular(
                      AppDoubles.cartItemImageBorderRadius)),
              child: Image.network(product.image),
            ),
            title: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  product.name,
                  style: const TextStyle(
                      fontWeight: AppFontWeights.bold,
                      fontSize: AppDoubles.normalFontSize),
                ),
                Text(
                  product.weight,
                  style: const TextStyle(
                      color: AppColors.lightGrey,
                      fontSize: AppDoubles.cartItemWeightFontSize),
                ),
                Text(
                  "\$${product.total.toStringAsFixed(2)}",
                  style: TextStyle(
                    color: Theme.of(context).primaryColor,
                    fontWeight: AppFontWeights.bold,
                    fontSize: AppDoubles.cartItemPriceFontSize,
                  ),
                )
              ],
            ),
            // * Add and remove from cart buttons
            trailing: SizedBox(
              width: width / 3.5,
              child: Row(
                children: [
                  Container(
                    width: AppDoubles.cartItemButtonWidth,
                    height: AppDoubles.cartItemButtonHeight,
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
                        iconSize: AppDoubles.cartItemButtonIconSize,
                        color: Theme.of(context).primaryColor,
                        onPressed: () {
                          BlocProvider.of<AppBloc>(context)
                              .add(RemoveFromCart(product));
                        },
                        icon: product.quantity == 1
                            ? const Icon(AppIcons.delete)
                            : const Icon(AppIcons.removeFromCart)),
                  ),
                  Container(
                    width: AppDoubles.cartItemButtonWidth,
                    height: AppDoubles.cartButtonHeight,
                    color: Theme.of(context).primaryColor,
                    child: Center(
                      child: Text(
                        product.quantity.toString(),
                        style: const TextStyle(
                            color: AppColors.formButtonTextColor,
                            fontSize: AppDoubles.normalFontSize,
                            fontWeight: AppFontWeights.bold),
                      ),
                    ),
                  ),
                  Container(
                    width: AppDoubles.cartItemButtonWidth,
                    height: AppDoubles.cartItemButtonHeight,
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
                      iconSize: AppDoubles.cartItemButtonIconSize,
                      color: Theme.of(context).primaryColor,
                      onPressed: () {
                        BlocProvider.of<AppBloc>(context)
                            .add(AddToCart(product));
                      },
                      icon: const Icon(AppIcons.addToCart),
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
        const Divider(
          color: AppColors.dividerColor,
        )
      ],
    );
  }
}
