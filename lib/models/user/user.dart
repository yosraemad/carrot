import 'package:carrot_app/models/product/product.dart';
import 'package:equatable/equatable.dart';

class UserModel extends Equatable {
  final String id;
  final bool isLoggedIn;

  const UserModel(this.id, {required this.isLoggedIn});

  @override
  List<Object?> get props => [isLoggedIn];
}
