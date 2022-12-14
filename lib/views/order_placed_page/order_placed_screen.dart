import 'package:carrot_app/resources/app_doubles.dart';
import 'package:carrot_app/resources/app_strings.dart';
import 'package:carrot_app/views/order_placed_page/widgets/accepted_order_text.dart';
import 'package:carrot_app/views/order_placed_page/widgets/back_home_button.dart';
import 'package:carrot_app/views/order_placed_page/widgets/success_image.dart';
import 'package:carrot_app/views/order_placed_page/widgets/success_text.dart';
import 'package:carrot_app/widgets/custom/form_button.dart';
import 'package:flutter/material.dart';

/// Screen that is shown when the user checks out
class OrderPlacedScreen extends StatelessWidget {
  const OrderPlacedScreen({key}) : super(key: key);

  static String routeName = "/success";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          const SuccessImage(),
          const SuccessText(),
          const AcceptedOrderText(),
          Padding(
            padding: const EdgeInsets.symmetric(
                vertical: AppDoubles.orderedPlacedScreenPaddingVertical,
                horizontal: AppDoubles.orderedPlacedScreenPaddingHorizontal),
            child:
                FormButton(text: AppStrings.trackOrderText, onPressed: () {}),
          ),
          const BackHomeButton(),
        ],
      ),
    );
  }
}
