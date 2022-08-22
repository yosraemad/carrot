import 'package:carrot_app/models/product/product.dart';
import 'package:carrot_app/views/item_page/item_page.dart';
import 'package:carrot_app/views/category_page/widgets/add_to_cart_button.dart';
import "package:flutter/material.dart";
import 'package:flutter_bloc/flutter_bloc.dart';

class CategoryItem extends StatelessWidget {
  final Map<String, dynamic> item;
  const CategoryItem(this.item, {key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(12),
      child: InkWell(
        onTap: () {
          Navigator.pushNamed(context, ItemPage.routeName,
              arguments: ItemPageArgs(item));
        },
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: Align(
                child: Stack(
                  clipBehavior: Clip.none,
                  children: [
                    Container(
                      decoration: BoxDecoration(
                          color: const Color(0xfffcfcfc),
                          border: Border.all(
                            color: const Color(0xffe0e0e0),
                          ),
                          borderRadius: BorderRadius.circular(16.0)),
                      child: Padding(
                        padding: const EdgeInsets.all(35.0),
                        child: Image.network(item["image"]),
                      ),
                    ),
                    Positioned(
                      top: -11.27,
                      right: -11,
                      child: AddToCartButton(Product.fromJson(item)),
                    )
                  ],
                ),
              ),
            ),
            Text(
              "\$${item["price"]}",
              style: TextStyle(color: Theme.of(context).primaryColor),
            ),
            Text(
              item['name'],
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
            Text(
              item['weight'],
              style: const TextStyle(color: Colors.grey),
            ),
          ],
        ),
      ),
    );
  }
}
