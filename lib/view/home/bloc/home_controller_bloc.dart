import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:kw_store_app/core/utils/strategy/base_strategy.dart';
import 'package:kw_store_app/local/local_product/local_product.dart';
import 'package:kw_store_app/model/category_model.dart';
import 'package:kw_store_app/model/product.dart';

part 'home_controller_event.dart';

part 'home_controller_state.dart';

class HomeControllerBloc
    extends Bloc<HomeControllerEvent, HomeControllerState> {
  HomeControllerBloc() : super(HomeControllerInitial()) {
    on<ChooseCategoryEvent>(_onChooseCategoryEvent);
    on<ExtractSelectedCategoryEvent>(_onExtractSelectedCategoryEvent);
    on<FilterProductsEvent>(_onFilterProductsEvent);
    on<AddProductToFavoriteEvent>(_onAddProductToFavoriteEvent);
    on<AddProductToFavoriteLocalDatabaseEvent>(
        _onAddProductToFavoriteLocalDatabaseEvent);
  }

  FutureOr<void> _onChooseCategoryEvent(
      ChooseCategoryEvent event, Emitter<HomeControllerState> emit) {
    final ChooseCategoryStrategy chooseCategoryStrategy =
        ChooseCategoryStrategy()
          ..categories = event.categories
          ..selectedCategory = event.selectedCategoryModel;
    final List<CategoryModel> categories = chooseCategoryStrategy.execute();
    emit(ChooseCategoryState(categories: categories));
  }

  FutureOr<void> _onExtractSelectedCategoryEvent(
      ExtractSelectedCategoryEvent event, Emitter<HomeControllerState> emit) {
    final ExtractSelectedCategoryStrategy extractSelectedCategoryStrategy =
        ExtractSelectedCategoryStrategy()..categories = event.categories;
    final CategoryModel category = extractSelectedCategoryStrategy.execute();
    emit(ExtractSelectedCategoryState(category: category));
  }

  FutureOr<void> _onFilterProductsEvent(
      FilterProductsEvent event, Emitter<HomeControllerState> emit) {
    final FilterProductsStrategy filterProductsStrategy =
        FilterProductsStrategy(
      products: event.products,
      category: event.category,
    );
    final List<Product> products = filterProductsStrategy.execute();
    emit(FilterProductsState(products: products));
  }

  FutureOr<void> _onAddProductToFavoriteEvent(
      AddProductToFavoriteEvent event, Emitter<HomeControllerState> emit) {
    final AddProductToFavoriteStrategy addProductToFavoriteStrategy =
        AddProductToFavoriteStrategy(
      allProducts: event.allProducts,
      filteredProducts: event.filteredProducts,
      product: event.product,
    );
    final products = addProductToFavoriteStrategy.execute();
    emit(AddProductToFavoriteState(
        allProducts: products.allProducts,
        filteredProducts: products.filteredProducts));
  }

  FutureOr<void> _onAddProductToFavoriteLocalDatabaseEvent(
      AddProductToFavoriteLocalDatabaseEvent event,
      Emitter<HomeControllerState> emit) {
    try {
      final LocalProduct localProduct = event.localProduct;
      final AddProductToFavoriteLocalDatabaseStrategy
          addProductToFavoriteLocalDatabaseStrategy =
          AddProductToFavoriteLocalDatabaseStrategy(
        localProduct: localProduct,
      );
      addProductToFavoriteLocalDatabaseStrategy.execute();
      emit(AddProductToFavoriteLocalDatabaseSuccessState());
    } catch (_) {
      emit(AddProductToFavoriteLocalDatabaseFailureState());
    }
  }
}
