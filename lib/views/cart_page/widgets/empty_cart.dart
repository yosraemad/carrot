import 'package:carrot_app/views/cart_page/cart_page.dart';
import 'package:carrot_app/widgets/custom/form_button.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class EmptyCart extends StatelessWidget {
  const EmptyCart(this.goHome, {key}) : super(key: key);
  final GoHomeFunction goHome;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Image.asset("assets/images/empty.png"),
        const Padding(
          padding: EdgeInsets.only(top: 36.2, bottom: 8),
          child: Text(
            "Your cart is empty",
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
          ),
        ),
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 90.0),
          child: Text(
            "Looks like you haven't made your choice yet...",
            style: TextStyle(fontSize: 16),
            textAlign: TextAlign.center,
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 42),
          child: FormButton(
              text: "Start Shopping",
              onPressed: () {
                goHome();
              }),
        ),
      ],
    );
  }
}
