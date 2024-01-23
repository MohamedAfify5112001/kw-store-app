import 'package:equatable/equatable.dart';
import 'package:kw_store_app/model/copyable.dart';
import 'package:kw_store_app/model/product.dart';

final class Cart extends Equatable implements BaseCopyableWith<Cart> {
  final int id;
  final Product product;
  final int quantity;

  const Cart({
    required this.id,
    required this.product,
    this.quantity = 0,
  });

  @override
  Cart copyWith({
    Product? product,
    int? quantity,
    int? id,
  }) =>
      Cart(
        id: id ?? this.id,
        product: product ?? this.product.copy(),
        quantity: quantity ?? this.quantity,
      );

  @override
  List<Object> get props => [product, quantity];
}
