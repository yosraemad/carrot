part of 'product_bloc.dart';

abstract class ProductEvent extends Equatable {
  const ProductEvent();

  @override
  List<Object> get props => [];
}

class AddToCart extends ProductEvent {
  final Product product;

  const AddToCart(this.product);

  @override
  List<Object> get props => [product];
}

class RemoveFromCart extends ProductEvent {
  final Product product;
  const RemoveFromCart(this.product);

  @override
  List<Object> get props => [product];
}

class SetCart extends ProductEvent {
  final List<Product> products;

  const SetCart(this.products);

  @override
  List<Object> get props => [products];
}
