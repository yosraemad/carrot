import 'package:carrot_app/resources/app_colors.dart';
import 'package:carrot_app/resources/app_doubles.dart';
import 'package:carrot_app/resources/app_font_weights.dart';
import 'package:carrot_app/resources/app_strings.dart';
import 'package:flutter/material.dart';

/// Custom widget for showing the product description
/// @param description: the description of the product
class ProductDescription extends StatelessWidget {
  final String description;
  const ProductDescription(this.description, {key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
          horizontal: AppDoubles.productDescriptionHorizontalPadding),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Padding(
            padding: EdgeInsets.only(
                bottom: AppDoubles.productDescriptionTextBottomPadding),
            child: Text(
              AppStrings.productDescription,
              style: TextStyle(
                fontSize: AppDoubles.normalFontSize,
                fontWeight: AppFontWeights.bold,
              ),
            ),
          ),
          Text(
            description,
            style: const TextStyle(
                color: AppColors.lightGrey,
                fontSize: AppDoubles.productDescriptionTextSize,
                height: AppDoubles.productDescriptionLineHeight),
          )
        ],
      ),
    );
  }
}
