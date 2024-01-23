import 'package:flutter/material.dart';
import 'package:kw_store_app/core/color/app_color.dart';
import 'package:kw_store_app/model/category_model.dart';

class HomeCategoriesWidget extends StatelessWidget {
  final List<CategoryModel> categories;
  final void Function(CategoryModel category) onTapCategory;

  const HomeCategoriesWidget({
    super.key,
    required this.categories,
    required this.onTapCategory,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 18.0,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) => CategoryTextWidget(
          category: categories[index],
          onTapCategory: onTapCategory,
        ),
        separatorBuilder: (context, index) => const SizedBox(
          width: 22.0,
        ),
        itemCount: categories.length,
      ),
    );
  }
}

class CategoryTextWidget extends StatelessWidget {
  final void Function(CategoryModel category) onTapCategory;

  const CategoryTextWidget({
    super.key,
    required this.category,
    required this.onTapCategory,
  });

  final CategoryModel category;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        onTapCategory(category);
      },
      child: Text(
        category.title,
        style: Theme.of(context).textTheme.displayLarge?.copyWith(
              fontSize: 14.0,
              fontWeight:
                  category.isSelected ? FontWeight.w600 : FontWeight.w400,
              color: category.isSelected
                  ? AppColorScheme.black
                  : AppColorScheme.greyCategory,
            ),
      ),
    );
  }
}
