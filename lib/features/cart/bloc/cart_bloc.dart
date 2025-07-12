import 'package:appmatic_test_project/core/utils/notifications.dart';
import 'package:appmatic_test_project/features/cart/bloc/cart_event.dart';
import 'package:appmatic_test_project/features/cart/bloc/cart_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CartBloc extends Bloc<CartEvent, CartState> {
  CartBloc() : super(CartState(cartList: [], totals: 0, addToCart: [])) {
    on<UpdateCartList>((event, emit) {
      emit(state.copyWith(cartList: event.updatedList));
    });

    on<AddToCart>((event, emit) {
      if (state.addToCart.contains(event.product)) {
        Notifications.message(message: "ALREADY ADDED");
      } else {
        final updatedList = [...state.addToCart, event.product];
        final total = updatedList.fold(0.0, (sum, item) => sum + item["price"]);
        emit(state.copyWith(addToCart: updatedList, totals: total));
        Notifications.message(message: "ADDED TO CART");
      }
    });

    on<RemoveFromCart>((event, emit) {
      final updatedList = [...state.addToCart]..removeAt(event.index);
      final total = updatedList.fold(0.0, (sum, item) => sum + item["price"]);

      emit(state.copyWith(addToCart: updatedList, totals: total));
    });

  }
}
