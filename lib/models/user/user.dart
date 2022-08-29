import 'package:equatable/equatable.dart';

// model to store user's id and whether the user is logged in or not
class UserModel extends Equatable {
  final String id;
  final bool isLoggedIn;

  const UserModel(this.id, {required this.isLoggedIn});

  @override
  List<Object?> get props => [isLoggedIn];
}
