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

  factory Product.fromJson(Map<String, dynamic> json) => Product(
        id: json["id"],
        name: json["name"],
        weight: json["weight"],
        price: json["price"].toDouble(),
        image: json["image"],
        description: json["description"],
        quantity: json["quantity"],
      );

  Map<String, dynamic> toMap() {
    return {
      "id": id,
      "name": name,
      "weight": weight,
      "price": price,
      "image": image,
      "description": description,
      "quantity": quantity,
    };
  }
}
