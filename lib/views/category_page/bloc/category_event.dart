part of 'category_bloc.dart';

abstract class CategoryEvent extends Equatable {
  const CategoryEvent(this.product, this.context);
  final Product? product;
  final BuildContext? context;

  @override
  List<Object> get props => [];
}

class AddToCart extends CategoryEvent {
  const AddToCart({required Product product, required BuildContext context})
      : super(product, context);
}

class RemoveFromCart extends CategoryEvent {
  const RemoveFromCart(
      {required Product product, required BuildContext context})
      : super(product, context);
}

class EndAnimation extends CategoryEvent {
  const EndAnimation() : super(null, null);
}
