import 'package:kw_store_app/local/hive_db/init_hive.dart';
import 'package:kw_store_app/local/local_product/local_product.dart';
import 'package:kw_store_app/model/cart.dart';
import 'package:kw_store_app/model/category_model.dart';
import 'package:kw_store_app/model/product.dart';

abstract interface class BaseStrategyApp<T> {
  T execute();
}

final class ChooseCategoryStrategy
    extends BaseStrategyApp<List<CategoryModel>> {
  late List<CategoryModel> _categories;
  late CategoryModel _selectedCategory;

  set categories(List<CategoryModel> value) {
    _categories = value;
  }

  set selectedCategory(CategoryModel value) {
    _selectedCategory = value;
  }

  @override
  List<CategoryModel> execute() {
    final List<CategoryModel> customCategories = _categories.toList();
    for (int i = 0; i < customCategories.length; i++) {
      if (customCategories[i] == _selectedCategory) {
        customCategories[i] = customCategories[i].copyWith(isSelected: true);
      } else {
        customCategories[i] = customCategories[i].copyWith(isSelected: false);
      }
    }
    return customCategories;
  }
}

final class ExtractSelectedCategoryStrategy
    extends BaseStrategyApp<CategoryModel> {
  late List<CategoryModel> _categories;

  set categories(List<CategoryModel> value) {
    _categories = value;
  }

  @override
  CategoryModel execute() =>
      _categories.singleWhere((category) => category.isSelected);
}

final class FilterProductsStrategy extends BaseStrategyApp<List<Product>> {
  final List<Product> products;
  final CategoryModel category;

  FilterProductsStrategy({required this.category, required this.products});

  @override
  List<Product> execute() {
    switch (category.type) {
      case CategoryType.none:
        return [];
      case CategoryType.all:
        return products;
      default:
        return products
            .where((element) => element.categoryType == category.type)
            .toList();
    }
  }
}

final class AddProductToFavoriteStrategy extends BaseStrategyApp<
    ({List<Product> allProducts, List<Product> filteredProducts})> {
  final List<Product> allProducts;
  final List<Product> filteredProducts;
  final Product product;

  AddProductToFavoriteStrategy({
    required this.allProducts,
    required this.filteredProducts,
    required this.product,
  });

  @override
  ({List<Product> allProducts, List<Product> filteredProducts}) execute() {
    final List<Product> allProductsFavorite = allProducts.toList();
    final List<Product> filteredProductsFavorite = filteredProducts.toList();
    for (int i = 0; i < allProductsFavorite.length; i++) {
      if (allProductsFavorite[i] == product) {
        allProductsFavorite[i] = allProductsFavorite[i]
            .copyWith(isFavorite: !allProductsFavorite[i].isFavorite);
        break;
      }
    }
    for (int i = 0; i < filteredProductsFavorite.length; i++) {
      if (filteredProductsFavorite[i] == product) {
        filteredProductsFavorite[i] = filteredProductsFavorite[i]
            .copyWith(isFavorite: !filteredProductsFavorite[i].isFavorite);
        break;
      }
    }
    return (
      allProducts: allProductsFavorite,
      filteredProducts: filteredProductsFavorite
    );
  }
}

final class AddProductToFavoriteLocalDatabaseStrategy
    extends BaseStrategyApp<void> {
  final LocalProduct localProduct;

  AddProductToFavoriteLocalDatabaseStrategy({required this.localProduct});

  @override
  void execute() {
    final favoriteBox = Boxes.favoriteBox;
    favoriteBox.put(localProduct.name, localProduct);
  }
}

final class IncreaseCartProductStrategy extends BaseStrategyApp<List<Cart>> {
  final List<Cart> carts;
  final Cart selectedCart;

  IncreaseCartProductStrategy({
    required this.carts,
    required this.selectedCart,
  });

  @override
  List<Cart> execute() {
    for (int i = 0; i < carts.length; i++) {
      if (carts[i].id == selectedCart.id) {
        carts[i] = carts[i].copyWith(quantity: carts[i].quantity + 1);
        break;
      }
    }
    return carts;
  }
}

final class DecreaseCartProductStrategy extends BaseStrategyApp<List<Cart>> {
  final List<Cart> carts;
  final Cart selectedCart;

  DecreaseCartProductStrategy({
    required this.carts,
    required this.selectedCart,
  });

  @override
  List<Cart> execute() {
    for (int i = 0; i < carts.length; i++) {
      if (carts[i].id == selectedCart.id) {
        if (carts[i].quantity > 0) {
          carts[i] = carts[i].copyWith(quantity: carts[i].quantity - 1);
          break;
        }
      }
    }
    return carts;
  }
}

final class TotalPriceCartProductsStrategy extends BaseStrategyApp<int> {
  final List<Cart> carts;

  TotalPriceCartProductsStrategy({required this.carts});

  @override
  int execute() {
    return carts.fold(
      0,
      (previousValue, element) =>
          previousValue +
          (element.quantity * int.parse(element.product.salaryAfterDiscount)),
    );
  }
}
