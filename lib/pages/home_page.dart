import 'package:carrot_app/widgets/home_page/carousel.dart';
import 'package:carrot_app/widgets/home_page/categories_grid.dart';
import 'package:carrot_app/widgets/home_page/home_appbar.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const HomeAppBar(),
      body: Column(children: const [
        Carousel(),
        Expanded(child: CategoriesGrid()),
      ]),
    );
  }
}
