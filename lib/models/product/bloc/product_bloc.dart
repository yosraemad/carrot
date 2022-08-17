import 'package:bloc/bloc.dart';
import 'package:carrot_app/models/product/product.dart';
import 'package:equatable/equatable.dart';

part 'product_event.dart';
part 'product_state.dart';

class ProductBloc extends Bloc<ProductEvent, ProductState> {
  ProductBloc() : super(ProductInitial([], 0)) {
    on<AddToCart>((event, emit) {
      emit(AddingToCart(state.products, state.props.length));
      try {
        Product? product = state.products
            .firstWhere((element) => element.id == event.product.id);
        product.incrementQuantity();
        List<Product> newList = List<Product>.from(state.products)
            .map((e) => e.id == product.id ? product : e)
            .toList();
        emit(AddedToCart(newList, state.props.length + 1));
      } on StateError {
        List<Product> newList = List<Product>.from(state.products);
        newList.add(event.product);
        emit(AddedToCart(newList, state.props.length + 1));
      }
    });

    on<RemoveFromCart>((event, emit) {
      emit(AddingToCart(state.products, state.props.length));
      Product product = state.products
          .firstWhere((element) => element.id == event.product.id);

      if (product.quantity > 1) {
        product.decrementQuantity();
        List<Product> newList = List<Product>.from(state.products)
            .map((e) => e.id == product.id ? product : e)
            .toList();
        emit(RemovedFromCart(newList, state.props.length - 1));
      } else {
        List<Product> newList = List<Product>.from(state.products);
        newList.remove(product);
        emit(RemovedFromCart(newList, state.props.length - 1));
      }
    });

    on<SetCart>(
        (event, emit) => emit(CartSet(event.products, state.props.length)));
  }
}
