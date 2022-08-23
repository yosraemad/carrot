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
      padding: const EdgeInsets.all(15.0),
      child: Container(
        width: double.infinity,
        height: 52,
        decoration: BoxDecoration(
          boxShadow: const [
            BoxShadow(
                color: Color.fromARGB(255, 234, 223, 223), blurRadius: 4.0)
          ],
          color: Colors.white,
          borderRadius: BorderRadius.circular(8),
        ),
        child: Row(
          children: [
            Container(
              height: double.infinity,
              padding: const EdgeInsets.symmetric(horizontal: 22),
              // * Text to show the total price
              child: Center(
                child: Text(
                  "\$${Utils.getTotalPrice(context).toStringAsFixed(2)}",
                  style: const TextStyle(
                      fontWeight: FontWeight.w600, fontSize: 16),
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
                  "Checkout",
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
