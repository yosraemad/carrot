import 'dart:convert';

import 'package:carrot_app/constants/app_curves.dart';
import 'package:carrot_app/constants/app_doubles.dart';
import 'package:carrot_app/constants/app_font_weights.dart';
import 'package:carrot_app/constants/app_strings.dart';
import 'package:carrot_app/views/category_page/category_page.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

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
  Future<List> readJson() async {
    List<dynamic>? products = (await FirebaseFirestore.instance
            .collection(AppStrings.allProductsMapKey)
            .get())
        .docs
        .toList();
    return products;
  }

  // For the fade in animation
  late final AnimationController _controller = AnimationController(
      duration: const Duration(seconds: AppDoubles.animationsDuration),
      vsync: this)
    ..forward();
  late final Animation<double> _animation = CurvedAnimation(
      parent: _controller, curve: AppCurves.fadeInAnimationCurve);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List>(
      // Fetch data from firestore
      future: readJson(),
      builder: ((context, snapshot) {
        if (snapshot.hasData) {
          return GridView.builder(
            gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                maxCrossAxisExtent: AppDoubles.categoriesMaxCrossAxisExtent),
            itemCount: snapshot.data?.length,
            itemBuilder: (context, index) {
              return InkWell(
                onTap: () {
                  /// Go to [CategoryPage]
                  Navigator.pushNamed(context, CategoryPage.routeName,
                      arguments: CategoryPageArgs(snapshot.data![index]));
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
                          snapshot.data![index][AppStrings.nameMapKey],
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
                          snapshot.data![index][AppStrings.imageMapKey],
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
