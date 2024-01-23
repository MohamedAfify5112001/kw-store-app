import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:kw_store_app/core/paths/app_image_paths.dart';
import 'package:kw_store_app/view/favorite/bloc/favorite_controller_bloc.dart';
import 'package:kw_store_app/view/home/widget/offer_product_widget.dart';
import 'package:top_snackbar_flutter/custom_snack_bar.dart';
import 'package:top_snackbar_flutter/top_snack_bar.dart';

import '../../model/product.dart';

class FavoriteScreen extends StatefulWidget {
  const FavoriteScreen({super.key});

  @override
  State<FavoriteScreen> createState() => _FavoriteScreenState();
}

class _FavoriteScreenState extends State<FavoriteScreen> {
  List<Product> _favorites = List.empty();

  FavoriteControllerBloc get _bloc =>
      BlocProvider.of<FavoriteControllerBloc>(context);

  @override
  void initState() {
    super.initState();
    log("Hello World");
    _bloc.add(FetchFavoriteProductsEvent());
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      child: SingleChildScrollView(
        padding: const EdgeInsetsDirectional.symmetric(
          horizontal: 24.0,
          vertical: 10.0,
        ),
        child: BlocConsumer<FavoriteControllerBloc, FavoriteControllerState>(
          listener: (context, state) {
            if (state is FetchFavoriteProductsSuccessState) {
              _favorites = state.favorites.toList();
            } else if (state is DeleteFavoriteProductsSuccessState) {
              showTopSnackBar(
                Overlay.of(context),
                const CustomSnackBar.success(
                  message: "تمت العملية بنجاح",
                ),
              );
              _bloc.add(FetchFavoriteProductsEvent());
            }
          },
          builder: (context, state) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'المفضلة',
                  style: Theme.of(context)
                      .textTheme
                      .displayLarge
                      ?.copyWith(fontSize: 18.0),
                ),
                const SizedBox(
                  height: 10.0,
                ),
                _FavoriteProductsWidget(
                  favorites: _favorites,
                  onTap: (deletedFavorite) => _bloc.add(
                    DeleteFavoriteProductsEvent(
                      deletedFavorite: deletedFavorite,
                    ),
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}

class _FavoriteProductsWidget extends StatelessWidget {
  final List<Product> favorites;
  final Function(Product) onTap;

  const _FavoriteProductsWidget({
    super.key,
    required this.favorites,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemBuilder: (context, index) {
        return _FavoriteItemWidget(
          favorite: favorites[index],
          onTap: onTap,
        );
      },
      separatorBuilder: (context, index) {
        return const SizedBox(
          height: 10.0,
        );
      },
      itemCount: favorites.length,
    );
  }
}

class _FavoriteItemWidget extends StatelessWidget {
  const _FavoriteItemWidget({
    super.key,
    required this.favorite,
    required this.onTap,
  });

  final Product favorite;
  final Function(Product) onTap;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          flex: 2,
          child: OfferItemWidget(
            offer: favorite,
          ),
        ),
        Expanded(
          child: Align(
            alignment: AlignmentDirectional.centerEnd,
            child: GestureDetector(
              onTap: () => onTap(favorite),
              child: SvgPicture.asset(
                AppImagePaths.remove,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
