import 'package:hive_flutter/hive_flutter.dart';

part 'local_product.g.dart';

@HiveType(typeId: 0)
class LocalProduct extends HiveObject {
  @HiveField(0)
  final String? name;
  @HiveField(1)
  final String? salary;
  @HiveField(2)
  final String? salaryAfterDiscount;
  @HiveField(3)
  final String? image;

  LocalProduct({
    this.name,
    this.salary,
    this.salaryAfterDiscount,
    this.image,
  });

  factory LocalProduct.fromJson(Map<String, dynamic> json) {
    return LocalProduct(
      name: json['name'],
      salary: json['salary'],
      salaryAfterDiscount: json['salaryAfterDiscount'],
      image: json['image'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'salary': salary,
      'salaryAfterDiscount': salaryAfterDiscount,
      'image': image,
    };
  }
}
