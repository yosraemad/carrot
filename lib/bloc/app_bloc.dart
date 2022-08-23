import 'package:bloc/bloc.dart';
import 'package:carrot_app/models/product/product.dart';
import 'package:carrot_app/models/user/user.dart';
import 'package:carrot_app/services/auth_service.dart';
import 'package:carrot_app/services/firestore_service.dart';
import 'package:carrot_app/utils/firebase_exception.dart';
import 'package:equatable/equatable.dart';

part 'app_event.dart';
part 'app_state.dart';

class AppBloc extends Bloc<AppEvent, AppState> {
  AppBloc()
      : super(const AppInitial(
            user: UserModel("", isLoggedIn: false),
            products: [],
            cartSet: false)) {
    on<SignUp>((event, emit) async {
      emit(UserLoggedIn(
          user: UserModel(event.userId, isLoggedIn: true),
          products: state.products,
          cartSet: state.cartSet));
    });

    on<SignIn>((event, emit) {
      emit(UserLoggedIn(
          user: UserModel(event.userId, isLoggedIn: true),
          products: state.products,
          cartSet: state.cartSet));
    });
    on<SignOut>((event, emit) async {
      try {
        await AuthService.signOutUser();
        emit(AppInitial(
            user: const UserModel("", isLoggedIn: false),
            products: const [],
            cartSet: state.cartSet));
      } on AppException catch (exception, _) {
        emit(ErrorOccurred(exception.toString(),
            user: state.user,
            products: state.products,
            cartSet: state.cartSet));
      }
    });

    on<AddToCart>((event, emit) {
      emit(AddingToCart(
          user: state.user, products: state.products, cartSet: state.cartSet));
      try {
        // get the product that is added to cart
        Product? product = state.products
            .firstWhere((element) => element.id == event.product.id);

        // increment the quantity of the product
        product.incrementQuantity();

        // create a new list with the new product
        List<Product> newList = List<Product>.from(state.products)
            .map((e) => e.id == product.id ? product : e)
            .toList();

        // update the database
        FirestoreService.setProductsInDatabase(state.user.id, newList);

        emit(AddedToCart(
            user: state.user, products: newList, cartSet: state.cartSet));
      } on StateError {
        // if the product is not already in cart, add it to the cart
        List<Product> newList = List<Product>.from(state.products);
        newList.add(event.product);

        // update firestore database
        FirestoreService.setProductsInDatabase(state.user.id, newList);

        emit(AddedToCart(
            user: state.user, products: newList, cartSet: state.cartSet));
      }
    });

    on<RemoveFromCart>((event, emit) {
      emit(AddingToCart(
          user: state.user, products: state.products, cartSet: state.cartSet));

      // get the product that is removed from cart
      Product product = state.products
          .firstWhere((element) => element.id == event.product.id);

      if (product.quantity > 1) {
        // we only want to decrement the quantity not remove it from list
        product.decrementQuantity();
        List<Product> newList = List<Product>.from(state.products)
            .map((e) => e.id == product.id ? product : e)
            .toList();

        // update firestore database
        FirestoreService.setProductsInDatabase(state.user.id, newList);

        emit(RemovedFromCart(
            user: state.user, products: newList, cartSet: state.cartSet));
      } else {
        // remove the product from the list
        List<Product> newList = List<Product>.from(state.products);
        newList.remove(product);

        // update firestore database
        FirestoreService.setProductsInDatabase(state.user.id, newList);

        emit(RemovedFromCart(
            user: state.user, products: newList, cartSet: state.cartSet));
      }
    });

    on<SetCart>((event, emit) async {
      if (state.user.id.isNotEmpty) {
        // get all products in user's cart
        List<dynamic>? products =
            await FirestoreService.getUserProducts(state.user.id);
        if (products != null) {
          // if there is an existing cart, set the products to the item in the cart
          emit(CartSet(
              user: state.user,
              products: products.map((e) => Product.fromJson(e)).toList(),
              cartSet: true));
        } else {
          // if there is no existing cart, set the products to an empty list
          emit(CartSet(user: state.user, products: const [], cartSet: true));
        }
      }
    });
  }
}
