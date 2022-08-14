import 'package:carrot_app/models/product.dart';
import 'package:equatable/equatable.dart';

class UserModel extends Equatable {
  final String id;
  final bool isLoggedIn;
  final List<Product> cart;

  const UserModel(this.id, {required this.isLoggedIn, required this.cart});

  @override
  List<Object?> get props => [isLoggedIn];
}
