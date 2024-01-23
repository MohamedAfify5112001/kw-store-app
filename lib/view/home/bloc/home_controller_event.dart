part of 'home_controller_bloc.dart';

abstract class HomeControllerEvent extends Equatable {
  @override
  List<Object> get props => [
        identityHashCode(this),
      ];
}

final class ChooseCategoryEvent extends HomeControllerEvent {
  final List<CategoryModel> categories;
  final CategoryModel selectedCategoryModel;

  ChooseCategoryEvent({
    required this.categories,
    required this.selectedCategoryModel,
  });

  @override
  List<Object> get props => [categories, selectedCategoryModel];
}

final class ExtractSelectedCategoryEvent extends HomeControllerEvent {
  final List<CategoryModel> categories;

  ExtractSelectedCategoryEvent({
    required this.categories,
  });

  @override
  List<Object> get props => [categories];
}

final class FilterProductsEvent extends HomeControllerEvent {
  final List<Product> products;
  final CategoryModel category;

  FilterProductsEvent({
    required this.products,
    required this.category,
  });

  @override
  List<Object> get props => [category, products];
}

final class AddProductToFavoriteEvent extends HomeControllerEvent {
  final List<Product> allProducts;
  final List<Product> filteredProducts;
  final Product product;

  AddProductToFavoriteEvent({
    required this.allProducts,
    required this.filteredProducts,
    required this.product,
  });

  @override
  List<Object> get props => [
        filteredProducts,
        product,
        allProducts,
      ];
}

final class AddProductToFavoriteLocalDatabaseEvent extends HomeControllerEvent {
  final LocalProduct localProduct;

  AddProductToFavoriteLocalDatabaseEvent({
    required this.localProduct,
  });

  @override
  List<Object> get props => [localProduct];
}
