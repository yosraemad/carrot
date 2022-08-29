import 'dart:convert';

import 'package:carrot_app/resources/app_curves.dart';
import 'package:carrot_app/resources/app_doubles.dart';
import 'package:carrot_app/resources/app_font_weights.dart';
import 'package:carrot_app/resources/app_strings.dart';
import 'package:carrot_app/views/category_page/category_page.dart';
import 'package:carrot_app/views/home_page/bloc/home_bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

/// Grid that shows all the categories from the firestore database
// ! It is a stateful widget because of the animations but it doesn't keep any
// ! logical state inside
class CategoriesGrid extends StatefulWidget {
  const CategoriesGrid({key}) : super(key: key);

  @override
  State<CategoriesGrid> createState() => _CategoriesGridState();
}

class _CategoriesGridState extends State<CategoriesGrid>
    with TickerProviderStateMixin {
  // Function that gets all products from the firestore
  getAllProducts() {
    BlocProvider.of<HomeBloc>(context).add(GetAllProducts());
  }

  // For the fade in animation
  late final AnimationController _controller = AnimationController(
      duration: const Duration(seconds: AppDoubles.animationsDuration),
      vsync: this)
    ..forward();
  late final Animation<double> _animation = CurvedAnimation(
      parent: _controller, curve: AppCurves.fadeInAnimationCurve);

  @override
  void initState() {
    if (context.read<HomeBloc>().allProductsSet == false) {
      getAllProducts();
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Builder(
      // Fetch data from firestore
      builder: ((context) {
        if (context.watch<HomeBloc>().allProductsSet) {
          return GridView.builder(
            physics: NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            scrollDirection: Axis.vertical,
            gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                maxCrossAxisExtent: AppDoubles.categoriesMaxCrossAxisExtent),
            itemCount: context.read<HomeBloc>().allProducts.length,
            itemBuilder: (context, index) {
              return InkWell(
                onTap: () {
                  /// Go to [CategoryPage]
                  Navigator.pushNamed(context, CategoryPage.routeName,
                      arguments: CategoryPageArgs(
                          context.read<HomeBloc>().allProducts[index]));
                },
                child: Card(
                  elevation: 3,
                  child: FadeTransition(
                    opacity: _animation,
                    child: GridTile(
                      header: Padding(
                        padding: const EdgeInsets.only(
                            top: AppDoubles.categoryGridTileTopPadding),
                        child: Text(
                          context.read<HomeBloc>().allProducts[index]
                              [AppStrings.nameMapKey],
                          textAlign: TextAlign.center,
                          style: const TextStyle(
                              fontWeight:
                                  AppFontWeights.categoriesGridFontWeight),
                        ),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(
                            AppDoubles.categoryImagePadding),
                        child: Image.network(
                          context.read<HomeBloc>().allProducts[index]
                              [AppStrings.imageMapKey],
                          fit: BoxFit.fill,
                        ),
                      ),
                    ),
                  ),
                ),
              );
            },
          );
        }
        return const Center(
          child: CircularProgressIndicator(),
        );
      }),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}
