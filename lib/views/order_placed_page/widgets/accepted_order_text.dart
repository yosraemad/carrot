import 'package:carrot_app/resources/app_colors.dart';
import 'package:carrot_app/resources/app_doubles.dart';
import 'package:carrot_app/resources/app_strings.dart';
import 'package:carrot_app/resources/app_text_aligns.dart';
import 'package:flutter/material.dart';

// Custom text to tell the user that the order is accepted
class AcceptedOrderText extends StatelessWidget {
  const AcceptedOrderText({key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.symmetric(
          horizontal: AppDoubles.acceptedOrderTextHorizontalPadding,
          vertical: AppDoubles.acceptedOrderTextVerticalPadding),
      child: Text(
        AppStrings.acceptedOrder,
        style: TextStyle(
            fontSize: AppDoubles.normalFontSize, color: AppColors.lightGrey),
        textAlign: AppTextAligns.acceptedOrderTextAlign,
      ),
    );
  }
}
