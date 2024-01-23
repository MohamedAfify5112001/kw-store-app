import 'package:equatable/equatable.dart';

enum CategoryType {
  none,
  all,
  phone,
  laptop,
  charge,
  smartWatch,
  camera,
}

final class CategoryModel extends Equatable {
  final String title;
  final bool isSelected;
  final CategoryType type;

  const CategoryModel({
    required this.title,
    this.isSelected = false,
    required this.type,
  });

  factory CategoryModel.empty() =>
      const CategoryModel(title: "", type: CategoryType.none);

  // copyWith
  CategoryModel copyWith({
    String? title,
    bool? isSelected,
    CategoryType? type,
  }) =>
      CategoryModel(
        title: title ?? this.title,
        type: type ?? this.type,
        isSelected: isSelected ?? this.isSelected,
      );

  @override
  List<Object> get props => [
        title,
        isSelected,
        type,
      ];
}
