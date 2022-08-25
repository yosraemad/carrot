import 'package:carrot_app/bloc/app_bloc.dart';
import 'package:carrot_app/resources/app_colors.dart';
import 'package:carrot_app/resources/app_icons.dart';
import 'package:carrot_app/models/product/product.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../resources/app_doubles.dart';

class AddToCartButton extends StatelessWidget {
  final double? width;
  final double? height;
  final double? iconSize;
  const AddToCartButton({
    Key? key,
    required this.product,
    this.width,
    this.height,
    this.iconSize,
  }) : super(key: key);

  final Product product;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
              blurRadius: AppDoubles.cartButtonBlurRadius,
              color: AppColors.lightGreen)
        ],
        color: AppColors.white,
      ),
      child: IconButton(
        iconSize: iconSize,
        splashColor: AppColors.noSplashIconButtonColor,
        color: Theme.of(context).primaryColor,
        onPressed: () {
          // notify app bloc with the new item added to cart
          BlocProvider.of<AppBloc>(context).add(AddToCart(product));
        },
        icon: const Icon(AppIcons.addToCart),
      ),
    );
  }
}
