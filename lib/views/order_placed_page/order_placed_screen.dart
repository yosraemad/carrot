import 'package:carrot_app/views/order_placed_page/widgets/accepted_order_text.dart';
import 'package:carrot_app/views/order_placed_page/widgets/back_home_button.dart';
import 'package:carrot_app/views/order_placed_page/widgets/success_image.dart';
import 'package:carrot_app/views/order_placed_page/widgets/success_text.dart';
import 'package:carrot_app/widgets/custom/form_button.dart';
import 'package:flutter/material.dart';

class OrderPlacedScreen extends StatelessWidget {
  const OrderPlacedScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          const SuccessImage(),
          const SuccessText(),
          const AcceptedOrderText(),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 38.0, horizontal: 15),
            child: FormButton(text: "Track Order", onPressed: () {}),
          ),
          const BackHomeButton(),
        ],
      ),
    );
  }
}
