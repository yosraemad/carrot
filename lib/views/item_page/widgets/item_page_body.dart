import 'package:carrot_app/constants/app_colors.dart';
import 'package:carrot_app/constants/app_doubles.dart';
import 'package:carrot_app/constants/app_font_weights.dart';
import 'package:carrot_app/constants/app_strings.dart';
import 'package:carrot_app/models/product/product.dart';
import 'package:carrot_app/views/item_page/widgets/cart_button.dart';
import 'package:carrot_app/views/item_page/widgets/product_description.dart';
import 'package:flutter/material.dart';

/// @param item: The product that we're showing details for (provided by database)
class ItemPageBody extends StatelessWidget {
  const ItemPageBody({
    Key? key,
    required this.item,
  }) : super(key: key);

  final Map<String, dynamic> item;

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      // * Item Image
      Padding(
        padding: const EdgeInsets.symmetric(
            horizontal: AppDoubles.itemImageHorizontalPadding,
            vertical: AppDoubles.itemImageVerticalPadding),
        child: Image.network(item[AppStrings.imageMapKey]),
      ),
      // * Item Price
      Padding(
        padding: const EdgeInsets.symmetric(
            vertical: AppDoubles.itemPriceHorizontalPadding),
        child: Text(
          "\$${item[AppStrings.priceMapKey]}",
          style: TextStyle(
            color: Theme.of(context).primaryColor,
            fontSize: AppDoubles.headerTwoFontSize,
            fontWeight: AppFontWeights.itemPageFontWeight,
          ),
        ),
      ),
      // * Item Name
      Text(
        item[AppStrings.nameMapKey],
        style: const TextStyle(
          fontSize: AppDoubles.headerTwoFontSize,
          fontWeight: AppFontWeights.itemPageFontWeight,
        ),
      ),
      // * Item Weight
      Padding(
        padding: const EdgeInsets.only(
            top: AppDoubles.itemWeightTopPadding,
            bottom: AppDoubles.itemWeightBottomPadding),
        child: Text(
          item[AppStrings.weightMapKey],
          style: const TextStyle(
            color: AppColors.lightGrey,
            fontSize: AppDoubles.normalFontSize,
          ),
        ),
      ),
      // * Item Description
      Align(
        alignment: Alignment.centerLeft,
        child: ProductDescription(item[AppStrings.descriptionMapKey]),
      ),
      // * Add to cart button
      Expanded(
        child: Align(
          alignment: Alignment.bottomCenter,
          child: CartButton(Product.fromJson(item)),
        ),
      ),
    ]);
  }
}
