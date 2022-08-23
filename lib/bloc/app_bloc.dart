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
            products: [],
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
        Product? product = state.products
            .firstWhere((element) => element.id == event.product.id);
        product.incrementQuantity();
        List<Product> newList = List<Product>.from(state.products)
            .map((e) => e.id == product.id ? product : e)
            .toList();
        FirestoreService.setProductsInDatabase(state.user.id, newList);
        emit(AddedToCart(
            user: state.user, products: newList, cartSet: state.cartSet));
      } on StateError {
        List<Product> newList = List<Product>.from(state.products);
        newList.add(event.product);
        FirestoreService.setProductsInDatabase(state.user.id, newList);
        emit(AddedToCart(
            user: state.user, products: newList, cartSet: state.cartSet));
      }
    });

    on<RemoveFromCart>((event, emit) {
      emit(AddingToCart(
          user: state.user, products: state.products, cartSet: state.cartSet));
      Product product = state.products
          .firstWhere((element) => element.id == event.product.id);

      if (product.quantity > 1) {
        product.decrementQuantity();
        List<Product> newList = List<Product>.from(state.products)
            .map((e) => e.id == product.id ? product : e)
            .toList();
        FirestoreService.setProductsInDatabase(state.user.id, newList);
        emit(RemovedFromCart(
            user: state.user, products: newList, cartSet: state.cartSet));
      } else {
        List<Product> newList = List<Product>.from(state.products);
        newList.remove(product);
        FirestoreService.setProductsInDatabase(state.user.id, newList);
        emit(RemovedFromCart(
            user: state.user, products: newList, cartSet: state.cartSet));
      }
    });

    on<SetCart>((event, emit) async {
      if (state.user.id.isNotEmpty) {
        List<dynamic>? products =
            await FirestoreService.getUserProducts(state.user.id);
        if (products != null) {
          emit(CartSet(
              user: state.user,
              products: products.map((e) => Product.fromJson(e)).toList(),
              cartSet: true));
        } else {
          emit(CartSet(user: state.user, products: const [], cartSet: true));
        }
      }
    });
  }
}
