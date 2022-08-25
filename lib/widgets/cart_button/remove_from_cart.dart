import 'package:carrot_app/bloc/app_bloc.dart';
import 'package:carrot_app/constants/app_colors.dart';
import 'package:carrot_app/constants/app_doubles.dart';
import 'package:carrot_app/models/product/product.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../constants/app_icons.dart';

class RemoveFromCartButton extends StatelessWidget {
  final Product product;
  final double? width;
  final double? height;
  final double? iconSize;
  final bool deleteIcon;
  const RemoveFromCartButton(this.product,
      {Key? key,
      this.width,
      this.height,
      this.iconSize,
      this.deleteIcon = false})
      : super(key: key);

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
          splashColor: AppColors.noSplashIconButtonColor,
          color: Theme.of(context).primaryColor,
          iconSize: iconSize,
          onPressed: () {
            // notify app bloc with the new item removed from cart
            BlocProvider.of<AppBloc>(context).add(RemoveFromCart(product));
          },
          icon: deleteIcon
              ? product.quantity == 1
                  ? const Icon(AppIcons.delete)
                  : const Icon(AppIcons.removeFromCart)
              : const Icon(AppIcons.removeFromCart)),
    );
  }
}
