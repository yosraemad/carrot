import 'package:carrot_app/models/product/product.dart';
import 'package:carrot_app/view_models/product_view_model.dart';
import 'package:flutter/material.dart';

class CartPageItem extends StatelessWidget {
  final Product product;
  const CartPageItem(this.product, {super.key});

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(20.0),
          child: ListTile(
            visualDensity: const VisualDensity(vertical: 4),
            leading: Container(
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                  border: Border.all(color: const Color(0xffe0e0e0)),
                  borderRadius: BorderRadius.circular(16.0)),
              child: Image.network(product.image),
            ),
            title: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  product.name,
                  style: const TextStyle(
                      fontWeight: FontWeight.bold, fontSize: 16),
                ),
                Text(
                  product.weight,
                  style:
                      const TextStyle(color: Color(0xff7c7c7c), fontSize: 14),
                ),
                Text(
                  "\$${product.total.toStringAsFixed(2)}",
                  style: TextStyle(
                    color: Theme.of(context).primaryColor,
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                  ),
                )
              ],
            ),
            trailing: SizedBox(
              width: width / 3.5,
              child: Row(
                children: [
                  Container(
                    width: 34,
                    height: 32,
                    decoration: BoxDecoration(
                      boxShadow: [
                        BoxShadow(
                            blurRadius: 4.0,
                            color: const Color(0xff006f18).withAlpha(30))
                      ],
                      color: Colors.white,
                    ),
                    child: IconButton(
                        splashColor: Colors.transparent,
                        iconSize: 17,
                        color: Theme.of(context).primaryColor,
                        onPressed: () {
                          ProductViewModel().removeFromCart(product, context);
                        },
                        icon: product.quantity == 1
                            ? const Icon(Icons.delete_outline)
                            : const Icon(Icons.remove)),
                  ),
                  Container(
                    width: 34,
                    height: 32,
                    color: Theme.of(context).primaryColor,
                    child: Center(
                      child: Text(
                        product.quantity.toString(),
                        style: const TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                  Container(
                    width: 34,
                    height: 32,
                    decoration: BoxDecoration(
                      boxShadow: [
                        BoxShadow(
                            blurRadius: 4.0,
                            color: const Color(0xff006f18).withAlpha(30))
                      ],
                      color: Colors.white,
                    ),
                    child: IconButton(
                      splashColor: Colors.transparent,
                      iconSize: 17,
                      color: Theme.of(context).primaryColor,
                      onPressed: () {
                        ProductViewModel().addToCart(product, context);
                      },
                      icon: const Icon(Icons.add),
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
        const Divider(
          color: Color(0xffe0e0e0),
        )
      ],
    );
  }
}
