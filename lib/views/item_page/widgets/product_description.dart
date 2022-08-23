import 'package:flutter/material.dart';

/// Custom widget for showing the product description
/// @param description: the description of the product
class ProductDescription extends StatelessWidget {
  final String description;
  const ProductDescription(this.description, {key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Padding(
            padding: EdgeInsets.only(bottom: 8.0),
            child: Text(
              "Product Details",
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Text(
            description,
            style: const TextStyle(
                color: Color(0xff7c7c7c), fontSize: 13, height: 1.38),
          )
        ],
      ),
    );
  }
}
