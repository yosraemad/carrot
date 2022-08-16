import 'package:carrot_app/models/product.dart';
import 'package:carrot_app/views/item_page/widgets/cart_button.dart';
import 'package:carrot_app/views/item_page/widgets/product_description.dart';
import 'package:flutter/material.dart';

class ItemPageBody extends StatelessWidget {
  const ItemPageBody({
    Key? key,
    required this.item,
  }) : super(key: key);

  final Map<String, dynamic> item;

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      Padding(
        padding: const EdgeInsets.symmetric(horizontal: 84.0, vertical: 40.0),
        child: Image.network(item["image"]),
      ),
      Padding(
        padding: const EdgeInsets.symmetric(vertical: 12.0),
        child: Text(
          "\$${item["price"]}",
          style: TextStyle(
            color: Theme.of(context).primaryColor,
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      Text(
        item["name"],
        style: const TextStyle(
          fontSize: 24,
          fontWeight: FontWeight.bold,
        ),
      ),
      Padding(
        padding: const EdgeInsets.only(top: 6.0, bottom: 30),
        child: Text(
          item["weight"],
          style: const TextStyle(
            color: Color(0xff7c7c7c),
            fontSize: 16,
          ),
        ),
      ),
      Align(
        alignment: Alignment.centerLeft,
        child: ProductDescription(item["description"]),
      ),
      Expanded(
        child: Align(
          alignment: Alignment.bottomCenter,
          child: CartButton(Product.fromJson(item)),
        ),
      ),
    ]);
  }
}
