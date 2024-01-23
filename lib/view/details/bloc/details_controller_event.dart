part of 'details_controller_bloc.dart';

abstract class DetailsControllerEvent extends Equatable {
  const DetailsControllerEvent();

  @override
  List<Object> get props => [];
}

final class AddProductToCartEvent extends DetailsControllerEvent {
  final Product product;

  const AddProductToCartEvent({required this.product});
}
