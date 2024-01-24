import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kw_store_app/core/color/app_color.dart';
import 'package:kw_store_app/model/cart.dart';
import 'package:kw_store_app/view/cart/bloc/cart_controller_bloc.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({super.key});

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  List<Cart> _cart = List.empty();

  int _total = 0;

  CartControllerBloc get _bloc => BlocProvider.of<CartControllerBloc>(context);

  @override
  void initState() {
    super.initState();
    _bloc.add(FetchCartProductEvent());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        padding: const EdgeInsetsDirectional.symmetric(
          horizontal: 24.0,
          vertical: 19.0,
        ),
        child: BlocConsumer<CartControllerBloc, CartControllerState>(
          listener: (context, state) {
            if (state is FetchCartProductSuccessState) {
              _cart = state.carts.toList();
            } else if (state is IncreaseQuantityCartProductState) {
              _cart = state.carts.toList();
              _bloc.add(TotalPriceCartProductEvent(cart: _cart));
            } else if (state is DecreaseQuantityCartProductState) {
              _cart = state.carts.toList();
              _bloc.add(TotalPriceCartProductEvent(cart: _cart));
            } else if (state is TotalPriceCartProductState) {
              _total = state.total;
            }
          },
          builder: (context, state) {
            return SizedBox(
              width: double.infinity,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'السلة',
                    style: Theme.of(context).textTheme.displayLarge?.copyWith(
                          fontSize: 25.0,
                        ),
                  ),
                  const SizedBox(
                    height: 20.0,
                  ),
                  _CartListWidget(
                    cart: _cart,
                    onTapAdd: (Cart cart) => _bloc.add(
                      IncreaseQuantityCartProductEvent(
                        cart: _cart,
                        selectedCard: cart,
                      ),
                    ),
                    onTapMinus: (Cart cart) => _bloc.add(
                      DecreaseQuantityCartProductEvent(
                        cart: _cart,
                        selectedCard: cart,
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 30.0,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'الاجمالي',
                        style:
                            Theme.of(context).textTheme.displayLarge?.copyWith(
                                  fontSize: 14.0,
                                ),
                      ),
                      Text(
                        '$_total  دينار',
                        style:
                            Theme.of(context).textTheme.displayLarge?.copyWith(
                                  fontSize: 14.0,
                                ),
                      ),
                    ],
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}

class _CartListWidget extends StatelessWidget {
  final List<Cart> cart;
  final Function(Cart) onTapAdd;
  final Function(Cart) onTapMinus;

  const _CartListWidget({
    super.key,
    required this.cart,
    required this.onTapAdd,
    required this.onTapMinus,
  });

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemBuilder: (context, index) => _CartItemWidget(
        cart: cart[index],
        onTapAdd: onTapAdd,
        onTapMinus: onTapMinus,
      ),
      separatorBuilder: (context, index) => const SizedBox(height: 20.0),
      itemCount: cart.length,
    );
  }
}

class _CartItemWidget extends StatelessWidget {
  final Cart cart;
  final Function(Cart) onTapAdd;
  final Function(Cart) onTapMinus;

  const _CartItemWidget({
    super.key,
    required this.cart,
    required this.onTapAdd,
    required this.onTapMinus,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsetsDirectional.symmetric(
        horizontal: 20.0,
        vertical: 14.0,
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadiusDirectional.circular(
          8.0,
        ),
        color: AppColorScheme.white,
        border: Border.all(
          color: AppColorScheme.blackWithAlphaThird,
        ),
      ),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Directionality(
                  textDirection: TextDirection.ltr,
                  child: Text(
                    cart.product.name,
                    style: Theme.of(context).textTheme.displayLarge?.copyWith(
                          fontSize: 14.0,
                        ),
                  ),
                ),
                const SizedBox(
                  height: 10.0,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      '${cart.product.salaryAfterDiscount} دينار',
                      style: Theme.of(context).textTheme.displayLarge?.copyWith(
                            fontSize: 12.0,
                          ),
                    ),
                    const SizedBox(
                      width: 20.0,
                    ),
                    Text(
                      '${cart.product.salary} دينار',
                      style: Theme.of(context).textTheme.displayLarge?.copyWith(
                            decoration: TextDecoration.lineThrough,
                            fontSize: 12.0,
                            color: AppColorScheme.greyCategory,
                          ),
                    ),
                  ],
                ),
                Row(
                  children: [
                    IconButton(
                      onPressed: () => onTapMinus(cart),
                      padding: EdgeInsets.zero,
                      icon: const Icon(
                        Icons.remove,
                        color: AppColorScheme.black,
                      ),
                    ),
                    Text(
                      cart.quantity.toString(),
                      style: Theme.of(context).textTheme.displayLarge?.copyWith(
                            fontSize: 14.0,
                          ),
                    ),
                    IconButton(
                      onPressed: () => onTapAdd(cart),
                      padding: EdgeInsets.zero,
                      icon: const Icon(
                        Icons.add,
                        color: AppColorScheme.black,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          const SizedBox(
            width: 10.0,
          ),
          ClipRRect(
            borderRadius: BorderRadiusDirectional.circular(
              8.0,
            ),
            child: Image.network(
              cart.product.image,
              width: 80.0,
              height: 80.0,
              fit: BoxFit.cover,
            ),
          ),
        ],
      ),
    );
  }
}
