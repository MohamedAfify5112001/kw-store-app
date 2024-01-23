import 'package:flutter/material.dart';
import 'package:kw_store_app/core/color/app_color.dart';
import 'package:kw_store_app/model/product.dart';

class CategoriesItemsWidget extends StatelessWidget {
  final List<Product> products;
  final Function(Product product) onTapFavorite;
  final Function(Product product) onTapProduct;

  const CategoriesItemsWidget({
    super.key,
    required this.products,
    required this.onTapFavorite,
    required this.onTapProduct,
  });

  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints: const BoxConstraints(
        minHeight: 170.0,
        maxHeight: 210.0,
      ),
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        physics: const BouncingScrollPhysics(),
        itemBuilder: (context, index) => _CategoryItemWidget(
          product: products[index],
          onTapFavorite: onTapFavorite,
          onTapProduct: onTapProduct,
        ),
        separatorBuilder: (context, index) => const SizedBox(
          width: 29.0,
        ),
        itemCount: products.length,
      ),
    );
  }
}

final class _CategoryItemWidget extends StatelessWidget {
  final Product product;
  final Function(Product product) onTapFavorite;
  final Function(Product product) onTapProduct;

  const _CategoryItemWidget({
    super.key,
    required this.product,
    required this.onTapFavorite,
    required this.onTapProduct,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => onTapProduct(product),
      child: Container(
        width: 149.0,
        constraints: const BoxConstraints(
          maxWidth: 149.0,
        ),
        decoration: BoxDecoration(
          color: AppColorScheme.bgCategoryItem,
          borderRadius: BorderRadiusDirectional.circular(8.0),
          border: Border.all(
            width: 1,
            color: const Color.fromRGBO(0, 0, 0, 0.04),
          ),
        ),
        child: Stack(
          children: [
            Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const SizedBox(
                  height: 23.0,
                ),
                Image.network(
                  product.image,
                  fit: BoxFit.contain,
                  width: 120.0,
                  height: 90.0,
                ),
                const SizedBox(
                  height: 25.0,
                ),
                Expanded(
                  child: Container(
                    padding: const EdgeInsetsDirectional.all(
                      8.0,
                    ),
                    decoration: BoxDecoration(
                      color: AppColorScheme.white,
                      borderRadius: BorderRadiusDirectional.circular(8.0),
                      border: Border.all(
                        width: 1,
                        color: const Color.fromRGBO(0, 0, 0, 0.04),
                      ),
                    ),
                    child: _ItemDetailsWidget(product: product),
                  ),
                )
              ],
            ),
            PositionedDirectional(
              start: 8.0,
              top: 8.0,
              child: InkWell(
                onTap: () => onTapFavorite(product),
                child: Icon(
                  product.isFavorite ? Icons.favorite : Icons.favorite_border,
                  color: product.isFavorite ? Colors.red : AppColorScheme.black,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

class _ItemDetailsWidget extends StatelessWidget {
  final Product product;

  const _ItemDetailsWidget({
    super.key,
    required this.product,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Directionality(
          textDirection: TextDirection.ltr,
          child: Text(
            product.name,
            overflow: TextOverflow.ellipsis,
            maxLines: 2,
            style: Theme.of(context).textTheme.displayLarge?.copyWith(
                  fontSize: 8.0,
                ),
          ),
        ),
        const SizedBox(
          height: 10.0,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              '${product.salaryAfterDiscount} دينار',
              style: Theme.of(context).textTheme.displayLarge?.copyWith(
                    fontSize: 12.0,
                  ),
            ),
            Text(
              '${product.salary} دينار',
              style: Theme.of(context).textTheme.displayLarge?.copyWith(
                    decoration: TextDecoration.lineThrough,
                    fontSize: 12.0,
                    color: AppColorScheme.greyCategory,
                  ),
            ),
          ],
        ),
      ],
    );
  }
}
