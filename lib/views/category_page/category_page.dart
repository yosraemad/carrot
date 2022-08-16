import 'package:carrot_app/views/category_page/widgets/category_item.dart';
import 'package:carrot_app/views/category_page/widgets/category_page_appbar.dart';
import 'package:flutter/material.dart';

class CategoryPageArgs {
  late final String name;
  late final String image;
  late final List items;

  CategoryPageArgs(data) {
    name = data["name"];
    image = data["image"];
    items = data["items"];
  }
}

class CategoryPage extends StatelessWidget {
  const CategoryPage({super.key});

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    final double itemHeight = (size.height - kToolbarHeight - 24) / 3;
    final double itemWidth = size.width / 2;
    final args = ModalRoute.of(context)!.settings.arguments as CategoryPageArgs;
    return Scaffold(
      appBar: CategoryPageAppBar(args: args),
      body: GridView.builder(
        itemCount: args.items.length,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2, childAspectRatio: (itemWidth / itemHeight)),
        itemBuilder: (context, index) {
          return CategoryItem(args.items[index]);
        },
      ),
    );
  }
}
