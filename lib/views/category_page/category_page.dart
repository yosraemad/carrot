import 'package:carrot_app/views/category_page/widgets/category_item.dart';
import 'package:carrot_app/views/category_page/widgets/category_page_appbar.dart';
import 'package:flutter/material.dart';

/// Arguments passed for the category page when it is navigated to
/// @param name: the name of the category
/// @param image: the image of the category
/// @param items: items inside the category
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
  const CategoryPage({key}) : super(key: key);

  static String routeName = "/category";

  @override
  Widget build(BuildContext context) {
    // get the size of the screen to adjust the aspect ratio of the category items
    var size = MediaQuery.of(context).size;
    final double itemHeight = (size.height - kToolbarHeight - 24) / 3;
    final double itemWidth = size.width / 2;

    // get the arguments passed to the category page
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
