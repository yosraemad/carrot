import 'package:bloc/bloc.dart';
import 'package:carrot_app/models/product.dart';
import 'package:carrot_app/models/user.dart';
import 'package:equatable/equatable.dart';

part 'user_event.dart';
part 'user_state.dart';

class UserBloc extends Bloc<UserEvent, UserState> {
  UserBloc()
      : super(UserInitial(const UserModel("", isLoggedIn: false, cart: []))) {
    on<SignUp>((event, emit) async {
      emit(UserSignedIn(UserModel(event.userId, isLoggedIn: true, cart: [])));
    });

    on<SignIn>((event, emit) {
      emit(UserSignedIn(UserModel(event.userId, isLoggedIn: true, cart: [])));
    });

    on<AddToCart>((event, emit) {
      emit(UserChangingCart(state.user));
      try {
        Product? product = state.user.cart
            .firstWhere((element) => element.id == event.product.id);
        product.incrementQuantity();
        List<Product> newList = List<Product>.from(state.user.cart)
            .map((e) => e.id == product.id ? product : e)
            .toList();
        emit(UserAddedToCart(UserModel(state.user.id,
            isLoggedIn: state.user.isLoggedIn, cart: newList)));
      } on StateError {
        List<Product> newList = List<Product>.from(state.user.cart);
        newList.add(event.product);
        emit(UserAddedToCart(UserModel(state.user.id,
            isLoggedIn: state.user.isLoggedIn, cart: newList)));
      }
    });

    on<RemoveFromCart>((event, emit) {
      emit(UserChangingCart(state.user));
      Product product = state.user.cart
          .firstWhere((element) => element.id == event.product.id);

      if (product.quantity > 1) {
        product.decrementQuantity();
        List<Product> newList = List<Product>.from(state.user.cart)
            .map((e) => e.id == product.id ? product : e)
            .toList();
        emit(UserRemovedFromCart(UserModel(state.user.id,
            isLoggedIn: state.user.isLoggedIn, cart: newList)));
      } else {
        List<Product> newList = List<Product>.from(state.user.cart);
        newList.remove(product);
        emit(UserRemovedFromCart(UserModel(state.user.id,
            isLoggedIn: state.user.isLoggedIn, cart: newList)));
      }
    });
  }
}
