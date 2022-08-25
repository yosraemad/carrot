import 'package:carrot_app/constants/app_colors.dart';
import 'package:carrot_app/constants/app_doubles.dart';
import 'package:carrot_app/constants/app_font_weights.dart';
import 'package:carrot_app/constants/app_strings.dart';
import 'package:carrot_app/utils/utils.dart';
import 'package:carrot_app/views/order_placed_page/order_placed_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

// Button that navigates user to the order placed page
class CheckoutButton extends StatelessWidget {
  const CheckoutButton({key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(AppDoubles.checkoutButtonPadding),
      child: Container(
        width: AppDoubles.maxWidth,
        height: AppDoubles.checkoutButtonHeight,
        decoration: BoxDecoration(
          boxShadow: const [
            BoxShadow(
                color: AppColors.checkoutButtonShadowColor,
                blurRadius: AppDoubles.checkoutButtonShadowBlurRadius)
          ],
          color: AppColors.white,
          borderRadius:
              BorderRadius.circular(AppDoubles.checkoutButtonBorderRadius),
        ),
        child: Row(
          children: [
            Container(
              height: AppDoubles.maxHeight,
              padding: const EdgeInsets.symmetric(
                  horizontal: AppDoubles.totalPriceHorizontalPadding),
              // * Text to show the total price
              child: Center(
                child: Text(
                  "\$${Utils.getTotalPrice(context).toStringAsFixed(2)}",
                  style: const TextStyle(
                      fontWeight: AppFontWeights.totalPriceFontWeight,
                      fontSize: AppDoubles.normalFontSize),
                ),
              ),
            ),
            Expanded(
              child: TextButton(
                style: TextButton.styleFrom(
                  padding: EdgeInsets.zero,
                  backgroundColor: Theme.of(context).primaryColor,
                  minimumSize: Size.infinite,
                ),
                onPressed: () {
                  Navigator.pushNamed(context, OrderPlacedScreen.routeName);
                },
                child: const Text(
                  AppStrings.checkoutText,
                  style: TextStyle(color: AppColors.formButtonTextColor),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
