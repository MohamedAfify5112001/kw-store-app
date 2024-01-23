import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:kw_store_app/core/utils/extension/extension.dart';
import 'package:kw_store_app/core/utils/strategy/base_strategy.dart';
import 'package:kw_store_app/local/isar_db/isar_db.dart';
import 'package:kw_store_app/local/local_product_cart/local_product_cart.dart';
import 'package:kw_store_app/model/cart.dart';

part 'cart_controller_event.dart';
part 'cart_controller_state.dart';

class CartControllerBloc
    extends Bloc<CartControllerEvent, CartControllerState> {
  CartControllerBloc() : super(CartControllerInitial()) {
    on<FetchCartProductEvent>(_onFetchCartProductEvent);
    on<IncreaseQuantityCartProductEvent>(_onIncreaseQuantityCartProductEvent);
    on<DecreaseQuantityCartProductEvent>(_onDecreaseQuantityCartProductEvent);
    on<TotalPriceCartProductEvent>(_onTotalPriceCartProductEvent);
  }

  FutureOr<void> _onFetchCartProductEvent(
      FetchCartProductEvent event, Emitter<CartControllerState> emit) async {
    try {
      final List<LocalProductCart> localCarts =
          await CartIsarDatabase().fetch();
      final List<Cart> cartProducts = localCarts.toCartList();
      emit(FetchCartProductSuccessState(carts: cartProducts));
    } catch (error) {
      emit(FetchCartProductFailureState());
    }
  }

  FutureOr<void> _onIncreaseQuantityCartProductEvent(
      IncreaseQuantityCartProductEvent event,
      Emitter<CartControllerState> emit) {
    final IncreaseCartProductStrategy increaseCartProductStrategy =
        IncreaseCartProductStrategy(
      carts: event.cart,
      selectedCart: event.selectedCard,
    );
    emit(IncreaseQuantityCartProductState(
      carts: increaseCartProductStrategy.execute(),
    ));
  }

  FutureOr<void> _onDecreaseQuantityCartProductEvent(
      DecreaseQuantityCartProductEvent event,
      Emitter<CartControllerState> emit) {
    final DecreaseCartProductStrategy decreaseCartProductStrategy =
        DecreaseCartProductStrategy(
      carts: event.cart,
      selectedCart: event.selectedCard,
    );
    emit(DecreaseQuantityCartProductState(
        carts: decreaseCartProductStrategy.execute()));
  }

  FutureOr<void> _onTotalPriceCartProductEvent(
      TotalPriceCartProductEvent event, Emitter<CartControllerState> emit) {
    final TotalPriceCartProductsStrategy totalPriceCartProductsStrategy =
        TotalPriceCartProductsStrategy(carts: event.cart);
    emit(TotalPriceCartProductState(
        total: totalPriceCartProductsStrategy.execute()));
  }
}
