// product model that stores data about any product
import 'package:carrot_app/constants/app_strings.dart';

class Product {
  Product({
    required this.id,
    required this.name,
    required this.weight,
    required this.price,
    required this.image,
    required this.description,
    this.quantity = 1,
  });

  int id;
  String name;
  String weight;
  double price;
  String image;
  String description;
  int quantity;

  void incrementQuantity() {
    quantity++;
  }

  void decrementQuantity() {
    quantity--;
  }

  double get total => quantity * price;

  // read product from json object
  factory Product.fromJson(Map<String, dynamic> json) => Product(
        id: json[AppStrings.idMapKey],
        name: json[AppStrings.nameMapKey],
        weight: json[AppStrings.weightMapKey],
        price: json[AppStrings.priceMapKey].toDouble(),
        image: json[AppStrings.imageMapKey],
        description: json[AppStrings.descriptionMapKey],
        quantity: json[AppStrings.quantityMapKey] ?? 1,
      );

  // convert product to a json object
  Map<String, dynamic> toMap() {
    return {
      AppStrings.idMapKey: id,
      AppStrings.nameMapKey: name,
      AppStrings.weightMapKey: weight,
      AppStrings.priceMapKey: price,
      AppStrings.imageMapKey: image,
      AppStrings.descriptionMapKey: description,
      AppStrings.quantityMapKey: quantity,
    };
  }
}
