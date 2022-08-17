class Product {
  Product({
    required this.id,
    required this.name,
    required this.weight,
    required this.price,
    required this.image,
    required this.description,
  });

  int id;
  String name;
  String weight;
  double price;
  String image;
  String description;
  int _quantity = 1;

  int get quantity => _quantity;

  void incrementQuantity() {
    _quantity++;
  }

  void decrementQuantity() {
    _quantity--;
  }

  double get total => _quantity * price;

  factory Product.fromJson(Map<String, dynamic> json) => Product(
        id: json["id"],
        name: json["name"],
        weight: json["weight"],
        price: json["price"].toDouble(),
        image: json["image"],
        description: json["description"],
      );
}
