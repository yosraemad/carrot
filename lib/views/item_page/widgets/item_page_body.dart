import 'package:carrot_app/models/product/product.dart';
import 'package:carrot_app/views/item_page/widgets/cart_button.dart';
import 'package:carrot_app/views/item_page/widgets/product_description.dart';
import 'package:flutter/material.dart';

/// @param item: The product that we're showing details for (provided by database)
class ItemPageBody extends StatelessWidget {
  const ItemPageBody({
    Key? key,
    required this.item,
  }) : super(key: key);

  final Map<String, dynamic> item;

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      // * Item Image
      Padding(
        padding: const EdgeInsets.symmetric(horizontal: 84.0, vertical: 40.0),
        child: Image.network(item["image"]),
      ),
      // * Item Price
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
      // * Item Name
      Text(
        item["name"],
        style: const TextStyle(
          fontSize: 24,
          fontWeight: FontWeight.bold,
        ),
      ),
      // * Item Weight
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
      // * Item Description
      Align(
        alignment: Alignment.centerLeft,
        child: ProductDescription(item["description"]),
      ),
      // * Add to cart button
      Expanded(
        child: Align(
          alignment: Alignment.bottomCenter,
          child: CartButton(Product.fromJson(item)),
        ),
      ),
    ]);
  }
}
