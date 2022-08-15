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
    final args = ModalRoute.of(context)!.settings.arguments as CategoryPageArgs;
    return Scaffold(
      appBar: AppBar(
        title: Text(args.name),
      ),
    );
  }
}
