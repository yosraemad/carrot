import 'package:carrot_app/bloc/app_bloc.dart';
import 'package:carrot_app/resources/app_colors.dart';
import 'package:carrot_app/resources/app_doubles.dart';
import 'package:carrot_app/resources/app_font_weights.dart';
import 'package:carrot_app/models/product/product.dart';
import 'package:flutter/material.dart';

class QuantityText extends StatelessWidget {
  final double width;
  final double height;
  final double fontSize;
  const QuantityText({
    Key? key,
    required this.quantity,
    required this.product,
    required this.width,
    required this.height,
    this.fontSize = AppDoubles.normalFontSize,
  }) : super(key: key);

  final String quantity;
  final Product product;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      color: Theme.of(context).primaryColor,
      child: Center(
        child: Text(
          quantity,
          style: TextStyle(
              color: AppColors.formButtonTextColor,
              fontSize: fontSize,
              fontWeight: AppFontWeights.itemPageFontWeight),
        ),
      ),
    );
  }
}

// Container(
//               width: AppDoubles.squareAddToCartText,
//               height: AppDoubles.squareAddToCartText,
//               color: Theme.of(context).primaryColor,
//               child: Center(
//                 child: Text(
//                   ,
//                   style: const TextStyle(
//                       color: AppColors.white,
//                       
//                       fontWeight: AppFontWeights.bold),
//                 ),
//               ),
//             ),
