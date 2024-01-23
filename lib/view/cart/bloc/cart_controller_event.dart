part of 'cart_controller_bloc.dart';

abstract class CartControllerEvent extends Equatable {
  const CartControllerEvent();

  @override
  List<Object> get props => [];
}

final class FetchCartProductEvent extends CartControllerEvent {}

final class IncreaseQuantityCartProductEvent extends CartControllerEvent {
  final List<Cart> cart;
  final Cart selectedCard;

  const IncreaseQuantityCartProductEvent({
    required this.cart,
    required this.selectedCard,
  });
}

final class DecreaseQuantityCartProductEvent extends CartControllerEvent {
  final List<Cart> cart;
  final Cart selectedCard;

  const DecreaseQuantityCartProductEvent({
    required this.cart,
    required this.selectedCard,
  });
}

final class TotalPriceCartProductEvent extends CartControllerEvent {
  final List<Cart> cart;

  const TotalPriceCartProductEvent({
    required this.cart,
  });
}
