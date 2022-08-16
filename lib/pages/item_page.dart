import 'package:carrot_app/bloc/user_bloc.dart';
import 'package:carrot_app/models/product.dart';
import 'package:carrot_app/widgets/item_page/cart_button.dart';
import 'package:carrot_app/widgets/item_page/product_description.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ItemPageArgs {
  final Map<String, dynamic> item;

  ItemPageArgs(this.item);
}

class ItemPage extends StatelessWidget {
  const ItemPage({super.key});

  @override
  Widget build(BuildContext context) {
    final item =
        (ModalRoute.of(context)!.settings.arguments as ItemPageArgs).item;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 1,
        leading: IconButton(
          splashColor: Colors.transparent,
          highlightColor: Colors.transparent,
          icon: const Icon(
            Icons.chevron_left,
            size: 40,
          ),
          onPressed: () => Navigator.pop(context),
        ),
        centerTitle: true,
        title: const Text("Product Details"),
        actions: const [
          Padding(
            padding: EdgeInsets.only(right: 15.0),
            child: Icon(
              Icons.favorite_outline,
              size: 30,
            ),
          )
        ],
      ),
      body: Column(children: [
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
      ]),
    );
  }
}
