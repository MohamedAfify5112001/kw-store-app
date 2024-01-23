import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kw_store_app/core/color/app_color.dart';
import 'package:kw_store_app/core/routes/app_routes.dart';
import 'package:kw_store_app/core/utils/extension/extension.dart';
import 'package:kw_store_app/local/local_product/local_product.dart';
import 'package:kw_store_app/model/category_model.dart';
import 'package:kw_store_app/model/product.dart';
import 'package:kw_store_app/view/home/bloc/home_controller_bloc.dart';
import 'package:kw_store_app/view/home/widget/home_banner_widget.dart';
import 'package:kw_store_app/view/home/widget/home_categories_widget.dart';
import 'package:kw_store_app/view/home/widget/home_search_widget.dart';
import 'package:kw_store_app/view/home/widget/offer_product_widget.dart';
import 'package:kw_store_app/view/utils/utils.dart';
import 'package:top_snackbar_flutter/custom_snack_bar.dart';
import 'package:top_snackbar_flutter/top_snack_bar.dart';

import 'widget/home_categories_items_widget.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<CategoryModel> _categories = List.empty();
  List<Product> _products = List.empty();
  List<Product> _offers = List.empty();
  List<Product> _filteredProducts = List.empty();

  @override
  void initState() {
    super.initState();
    _categories = CategoriesList.categories;
    _products = ProductList.products;
    _offers = OffersList.offers;
    _filteredProducts = ProductList.products;
  }

  HomeControllerBloc get _bloc => BlocProvider.of<HomeControllerBloc>(context);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.symmetric(horizontal: 24.0),
      child: BlocConsumer<HomeControllerBloc, HomeControllerState>(
        listener: (context, state) {
          if (state is ChooseCategoryState) {
            _categories = state.categories;
            _bloc.add(ExtractSelectedCategoryEvent(categories: _categories));
          } else if (state is ExtractSelectedCategoryState) {
            _bloc.add(FilterProductsEvent(
              products: _products,
              category: state.category,
            ));
          } else if (state is FilterProductsState) {
            _filteredProducts = state.products;
          } else if (state is AddProductToFavoriteState) {
            _products = state.allProducts;
            _filteredProducts = state.filteredProducts;
          } else if (state is AddProductToFavoriteLocalDatabaseSuccessState) {
            showTopSnackBar(
              Overlay.of(context),
              const CustomSnackBar.success(
                message: "تمت العملية بنجاح",
              ),
            );
          }
        },
        builder: (context, state) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                height: 19.0,
              ),
              const HomeSearchWidget(),
              const SizedBox(
                height: 24.0,
              ),
              const HomeBannerWidget(),
              const SizedBox(
                height: 35.0,
              ),
              HomeCategoriesWidget(
                categories: _categories,
                onTapCategory: (CategoryModel selectedCategoryModel) =>
                    _bloc.add(
                  ChooseCategoryEvent(
                    categories: _categories,
                    selectedCategoryModel: selectedCategoryModel,
                  ),
                ),
              ),
              const SizedBox(
                height: 18.0,
              ),
              CategoriesItemsWidget(
                products: _filteredProducts,
                onTapProduct: (Product product) {
                  Navigator.pushNamed(
                    context,
                    AppRoutes.details,
                    arguments: product,
                  );
                },
                onTapFavorite: (Product product) {
                  _bloc.add(
                    AddProductToFavoriteEvent(
                      allProducts: _products,
                      filteredProducts: _filteredProducts,
                      product: product,
                    ),
                  );
                  _bloc.add(
                    AddProductToFavoriteLocalDatabaseEvent(
                      localProduct: product.toLocalProduct(),
                    ),
                  );
                },
              ),
              const SizedBox(
                height: 24.0,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'عروض مميزة',
                    style: Theme.of(context).textTheme.displayLarge?.copyWith(
                          fontSize: 14.0,
                        ),
                  ),
                  Text(
                    'عرض الكل',
                    style: Theme.of(context).textTheme.displayLarge?.copyWith(
                          fontSize: 10.0,
                          color: AppColorScheme.greyCategory,
                        ),
                  ),
                ],
              ),
              const SizedBox(
                height: 12.0,
              ),
              OffersProductsWidget(
                offers: _offers,
              ),
            ],
          );
        },
      ),
    );
  }
}
