part of 'product_bloc.dart';

abstract class ProductState extends Equatable {
  const ProductState(this.products, this.length);

  final int length;
  final List<Product> products;

  @override
  List<Object> get props => [products, length];
}

class ProductInitial extends ProductState {
  const ProductInitial(super.products, super.length);
}

class AddedToCart extends ProductState {
  const AddedToCart(super.products, super.length);

  @override
  List<Object> get props => [products, length];
}

class RemovedFromCart extends ProductState {
  const RemovedFromCart(super.products, super.length);

  @override
  List<Object> get props => [products, length];
}
