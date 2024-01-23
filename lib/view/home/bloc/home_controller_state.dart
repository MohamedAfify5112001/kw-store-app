part of 'home_controller_bloc.dart';

abstract class HomeControllerState extends Equatable {
  @override
  List<Object> get props => [
        identityHashCode(this),
      ];
}

final class HomeControllerInitial extends HomeControllerState {}

final class ChooseCategoryState extends HomeControllerState {
  final List<CategoryModel> categories;

  ChooseCategoryState({required this.categories});

  @override
  List<Object> get props => [categories];
}

final class ExtractSelectedCategoryState extends HomeControllerState {
  final CategoryModel category;

  ExtractSelectedCategoryState({required this.category});

  @override
  List<Object> get props => [category];
}

final class FilterProductsState extends HomeControllerState {
  final List<Product> products;

  FilterProductsState({
    required this.products,
  });

  @override
  List<Object> get props => [products];
}

final class AddProductToFavoriteState extends HomeControllerState {
  final List<Product> allProducts;
  final List<Product> filteredProducts;

  AddProductToFavoriteState({
    required this.allProducts,
    required this.filteredProducts,
  });

  @override
  List<Object> get props => [allProducts, filteredProducts];
}

final class AddProductToFavoriteLocalDatabaseSuccessState
    extends HomeControllerState {}

final class AddProductToFavoriteLocalDatabaseFailureState
    extends HomeControllerState {}
