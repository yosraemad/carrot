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
  List<Product> products = [];
  UserModel user = const UserModel("", isLoggedIn: false);
  bool cartSet = false;
  String? message;
  AppBloc() : super(AppInitial()) {
    on<SignUp>((event, emit) async {
      user = UserModel(event.userId, isLoggedIn: true);
      emit(UserLoggedIn());
    });

    on<SignIn>((event, emit) {
      user = UserModel(event.userId, isLoggedIn: true);
      emit(UserLoggedIn());
    });
    on<SignOut>((event, emit) async {
      try {
        await AuthService.signOutUser();
        user = const UserModel("", isLoggedIn: false);
        products = [];
        cartSet = false;
        emit(AppInitial());
      } on AppException catch (exception, _) {
        emit(ErrorOccurred(exception.toString()));
      }
    });

    on<AddToCart>((event, emit) {
      emit(AddingToCart());
      try {
        // get the product that is added to cart
        Product? product =
            products.firstWhere((element) => element.id == event.product.id);

        // increment the quantity of the product
        product.incrementQuantity();

        // create a new list with the new product
        List<Product> newList = List<Product>.from(products)
            .map((e) => e.id == product.id ? product : e)
            .toList();

        // update the database
        FirestoreService.setProductsInDatabase(user.id, newList);

        products = newList;
        emit(AddedToCart());
      } on StateError {
        // if the product is not already in cart, add it to the cart
        List<Product> newList = List<Product>.from(products);
        newList.add(event.product);

        // update firestore database
        FirestoreService.setProductsInDatabase(user.id, newList);

        products = newList;

        emit(AddedToCart());
      }
    });

    on<RemoveFromCart>((event, emit) {
      emit(AddingToCart());

      // get the product that is removed from cart
      Product product =
          products.firstWhere((element) => element.id == event.product.id);

      if (product.quantity > 1) {
        // we only want to decrement the quantity not remove it from list
        product.decrementQuantity();
        List<Product> newList = List<Product>.from(products)
            .map((e) => e.id == product.id ? product : e)
            .toList();

        // update firestore database
        FirestoreService.setProductsInDatabase(user.id, newList);

        products = newList;

        emit(RemovedFromCart());
      } else {
        // remove the product from the list
        List<Product> newList = List<Product>.from(products);
        newList.remove(product);

        // update firestore database
        FirestoreService.setProductsInDatabase(user.id, newList);

        products = newList;

        emit(RemovedFromCart());
      }
    });

    on<SetCart>((event, emit) async {
      if (user.id.isNotEmpty) {
        // get all products in user's cart
        List<dynamic>? productsFromDb =
            await FirestoreService.getUserProducts(user.id);
        if (products != null) {
          // if there is an existing cart, set the products to the item in the cart
          products = productsFromDb!.map((e) => Product.fromJson(e)).toList();
          cartSet = true;
          emit(CartSet());
        } else {
          // if there is no existing cart, set the products to an empty list
          products = [];
          cartSet = true;
          emit(CartSet());
        }
      }
    });

    on<EmptyCart>((event, emit) {
      FirestoreService.setProductsInDatabase(user.id, []);
      products = [];
      cartSet = true;
      emit(CartSet());
    });
  }
}
