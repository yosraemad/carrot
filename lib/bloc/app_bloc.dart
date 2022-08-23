import 'package:bloc/bloc.dart';
import 'package:carrot_app/models/product/product.dart';
import 'package:carrot_app/models/user/user.dart';
import 'package:carrot_app/services/auth_service.dart';
import 'package:carrot_app/utils/firebase_exception.dart';
import 'package:equatable/equatable.dart';

part 'app_event.dart';
part 'app_state.dart';

class AppBloc extends Bloc<AppEvent, AppState> {
  AppBloc()
      : super(const AppInitial(
            user: UserModel("", isLoggedIn: false), products: [])) {
    on<SignUp>((event, emit) async {
      emit(UserLoggedIn(
          user: UserModel(event.userId, isLoggedIn: true),
          products: state.products));
    });

    on<SignIn>((event, emit) {
      emit(UserLoggedIn(
          user: UserModel(event.userId, isLoggedIn: true),
          products: state.products));
    });
    on<SignOut>((event, emit) async {
      try {
        await AuthService.signOutUser();
        emit(const AppInitial(
            user: const UserModel("", isLoggedIn: false), products: []));
      } on AppException catch (exception, _) {
        emit(ErrorOccurred(exception.toString(),
            user: state.user, products: state.products));
      }
    });

    on<AddToCart>((event, emit) {
      emit(AddingToCart(user: state.user, products: state.products));
      try {
        Product? product = state.products
            .firstWhere((element) => element.id == event.product.id);
        product.incrementQuantity();
        List<Product> newList = List<Product>.from(state.products)
            .map((e) => e.id == product.id ? product : e)
            .toList();
        emit(AddedToCart(user: state.user, products: newList));
      } on StateError {
        List<Product> newList = List<Product>.from(state.products);
        newList.add(event.product);
        emit(AddedToCart(user: state.user, products: newList));
      }
    });

    on<RemoveFromCart>((event, emit) {
      emit(AddingToCart(user: state.user, products: state.products));
      Product product = state.products
          .firstWhere((element) => element.id == event.product.id);

      if (product.quantity > 1) {
        product.decrementQuantity();
        List<Product> newList = List<Product>.from(state.products)
            .map((e) => e.id == product.id ? product : e)
            .toList();
        emit(RemovedFromCart(user: state.user, products: newList));
      } else {
        List<Product> newList = List<Product>.from(state.products);
        newList.remove(product);
        emit(RemovedFromCart(user: state.user, products: newList));
      }
    });

    on<SetCart>((event, emit) =>
        emit(CartSet(user: state.user, products: event.products)));
  }
}
