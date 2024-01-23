import 'package:equatable/equatable.dart';
import 'package:kw_store_app/model/category_model.dart';
import 'package:kw_store_app/model/copyable.dart';

final class Product extends Equatable implements Copyable<Product> {
  final String name;
  final String salary;
  final String salaryAfterDiscount;
  final String image;
  final bool isFavorite;
  final CategoryType categoryType;

  const Product({
    required this.name,
    required this.salary,
    required this.salaryAfterDiscount,
    required this.image,
    required this.categoryType,
    this.isFavorite = false,
  });

  factory Product.empty() => const Product(
        name: '',
        salary: '',
        salaryAfterDiscount: '',
        image: '',
        categoryType: CategoryType.none,
      );

  @override
  Product copyWith({
    String? name,
    String? salary,
    String? salaryAfterDiscount,
    String? image,
    bool? isFavorite,
    CategoryType? categoryType,
  }) =>
      Product(
        name: name ?? this.name,
        salary: salary ?? this.salary,
        salaryAfterDiscount: salaryAfterDiscount ?? this.salaryAfterDiscount,
        image: this.image,
        isFavorite: isFavorite ?? this.isFavorite,
        categoryType: categoryType ?? this.categoryType,
      );

  @override
  Product copy() => Product(
        name: name,
        salary: salary,
        salaryAfterDiscount: salaryAfterDiscount,
        image: image,
        categoryType: categoryType,
      );

  @override
  List<Object> get props => [
        name,
        salary,
        salaryAfterDiscount,
        image,
        isFavorite,
        categoryType,
      ];
}
