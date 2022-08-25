import 'package:carrot_app/bloc/app_bloc.dart';
import 'package:carrot_app/constants/app_colors.dart';
import 'package:carrot_app/constants/app_doubles.dart';
import 'package:carrot_app/constants/app_font_weights.dart';
import 'package:carrot_app/constants/app_icons.dart';
import 'package:carrot_app/models/product/product.dart';
import 'package:carrot_app/widgets/cart_button/add_to_cart.dart';
import 'package:carrot_app/widgets/cart_button/quantity_text.dart';
import 'package:carrot_app/widgets/cart_button/remove_from_cart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

/// ListTile of one item in the cart
/// @param product: a product inside the cart
class CartPageItem extends StatelessWidget {
  final Product product;
  const CartPageItem(this.product, {key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
              width: AppDoubles.cartItemButtonWidth * 3,
              child: Row(
                children: [
                  RemoveFromCartButton(
                    product,
                    width: AppDoubles.cartItemButtonWidth,
                    height: AppDoubles.cartItemButtonHeight,
                    iconSize: AppDoubles.cartItemButtonIconSize,
                    deleteIcon: true,
                  ),
                  QuantityText(
                    quantity: product.quantity.toString(),
                    product: product,
                    width: AppDoubles.cartItemButtonWidth,
                    height: AppDoubles.cartButtonHeight,
                  ),
                  AddToCartButton(
                    product: product,
                    width: AppDoubles.cartItemButtonWidth,
                    height: AppDoubles.cartItemButtonHeight,
                    iconSize: AppDoubles.cartItemButtonIconSize,
                  ),
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
