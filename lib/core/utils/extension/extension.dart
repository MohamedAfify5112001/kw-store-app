import 'package:kw_store_app/local/local_product_cart/local_product_cart.dart';
import 'package:kw_store_app/model/cart.dart';
import 'package:kw_store_app/model/category_model.dart';
import 'package:kw_store_app/model/product.dart';

import '../../../local/local_product/local_product.dart';

extension ConvertProductToLocalProduct on Product {
  LocalProduct toLocalProduct() => LocalProduct(
        name: name,
        image: image,
        salary: salary,
        salaryAfterDiscount: salaryAfterDiscount,
      );
}

extension ConvertLocalProductToProduct on LocalProduct {
  Product toProduct() => Product(
        name: name ?? "",
        image: image ?? "",
        salary: salary ?? "",
        salaryAfterDiscount: salaryAfterDiscount ?? "",
        categoryType: CategoryType.none,
      );
}

extension ConvertListOfLocalProductToProduct on List<LocalProduct> {
  List<Product> toProducts() => map((e) => e.toProduct()).toList();
}

extension ConvertProductToLocalCartProduct on Product {
  LocalProductCart toLocalProductCart() => LocalProductCart()
    ..name = name
    ..salary = salary
    ..salaryAfterDiscount = salaryAfterDiscount
    ..image = image;
}

extension ConvertLocalCartProductToCartProduct on LocalProductCart {
  Cart toCart() => Cart(
        id: id,
        product: Product(
          name: name,
          salary: salary,
          salaryAfterDiscount: salaryAfterDiscount,
          image: image,
          categoryType: CategoryType.all,
        ),
      );
}

extension ConvertLocalCartProductToCartProductList on List<LocalProductCart> {
  List<Cart> toCartList() => map((e) => e.toCart()).toList();
}
