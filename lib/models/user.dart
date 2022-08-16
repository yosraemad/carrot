import 'package:carrot_app/models/product.dart';
import 'package:equatable/equatable.dart';

class UserModel extends Equatable {
  final String id;
  final bool isLoggedIn;
  final List<Product> cart;

  const UserModel(this.id, {required this.isLoggedIn, required this.cart});

  double get totalPrice {
    double total = 0;
    for (int i = 0; i < cart.length; i++) {
      total += cart[i].total;
    }
    return total;
  }

  @override
  List<Object?> get props => [isLoggedIn];
}
