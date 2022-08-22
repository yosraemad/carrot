part of 'product_bloc.dart';

abstract class ProductState extends Equatable {
  const ProductState(this.products, this.length);

  final int length;
  final List<Product> products;

  @override
  List<Object> get props => [products, length];
}

class ProductInitial extends ProductState {
  const ProductInitial(List<Product> products, int length)
      : super(products, length);
}

class AddingToCart extends ProductState {
  const AddingToCart(List<Product> products, int length)
      : super(products, length);

  @override
  List<Object> get props => [products, length];
}

class AddedToCart extends ProductState {
  const AddedToCart(List<Product> products, int length)
      : super(products, length);

  @override
  List<Object> get props => [products, length];
}

class RemovedFromCart extends ProductState {
  const RemovedFromCart(List<Product> products, int length)
      : super(products, length);

  @override
  List<Object> get props => [products, length];
}

class CartSet extends ProductState {
  const CartSet(List<Product> products, int length) : super(products, length);

  @override
  List<Object> get props => [products, length];
}
