import 'dart:convert';

import 'package:carrot_app/views/category_page/category_page.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class CategoriesGrid extends StatefulWidget {
  const CategoriesGrid({super.key});

  @override
  State<CategoriesGrid> createState() => _CategoriesGridState();
}

class _CategoriesGridState extends State<CategoriesGrid>
    with TickerProviderStateMixin {
  Future<List> readJson() async {
    List<dynamic>? products =
        (await FirebaseFirestore.instance.collection("all-products").get())
            .docs
            .toList();
    return products;
  }

  late final AnimationController _controller =
      AnimationController(duration: const Duration(seconds: 1), vsync: this)
        ..forward();
  late final Animation<double> _animation =
      CurvedAnimation(parent: _controller, curve: Curves.easeIn);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List>(
      future: readJson(),
      builder: ((context, snapshot) {
        if (snapshot.hasData) {
          return GridView.builder(
            gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                maxCrossAxisExtent: 200),
            itemCount: snapshot.data?.length,
            itemBuilder: (context, index) {
              return InkWell(
                onTap: () {
                  Navigator.pushNamed(context, "/category",
                      arguments: CategoryPageArgs(snapshot.data![index]));
                },
                child: Card(
                  elevation: 3,
                  child: FadeTransition(
                    opacity: _animation,
                    child: GridTile(
                      header: Padding(
                        padding: const EdgeInsets.only(top: 8.0),
                        child: Text(
                          snapshot.data![index]["name"],
                          textAlign: TextAlign.center,
                          style: const TextStyle(fontWeight: FontWeight.bold),
                        ),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(40.0),
                        child: Image.network(
                          snapshot.data![index]["image"],
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
