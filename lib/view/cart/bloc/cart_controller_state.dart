part of 'cart_controller_bloc.dart';

abstract class CartControllerState extends Equatable {
  @override
  List<Object> get props => [
        identityHashCode(this),
      ];
}

class CartControllerInitial extends CartControllerState {}

class FetchCartProductSuccessState extends CartControllerState {
  final List<Cart> carts;

  FetchCartProductSuccessState({required this.carts});
}

class FetchCartProductFailureState extends CartControllerState {}

class IncreaseQuantityCartProductState extends CartControllerState {
  final List<Cart> carts;

  IncreaseQuantityCartProductState({required this.carts});
}

class DecreaseQuantityCartProductState extends CartControllerState {
  final List<Cart> carts;

  DecreaseQuantityCartProductState({required this.carts});
}

final class TotalPriceCartProductState extends CartControllerState {
  final int total;

  TotalPriceCartProductState({
    required this.total,
  });
}
