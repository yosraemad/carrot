import 'package:carrot_app/models/product/product.dart';
import 'package:carrot_app/views/item_page/widgets/cart_button.dart';
import 'package:carrot_app/views/item_page/widgets/item_page_appbar.dart';
import 'package:carrot_app/views/item_page/widgets/item_page_body.dart';
import 'package:carrot_app/views/item_page/widgets/product_description.dart';
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
      appBar: const ItemPageAppBar(),
      body: ItemPageBody(item: item),
    );
  }
}
