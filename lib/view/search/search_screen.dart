import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:kw_store_app/core/color/app_color.dart';
import 'package:kw_store_app/core/paths/app_image_paths.dart';
import 'package:kw_store_app/model/company_product.dart';
import 'package:kw_store_app/view/search/bloc/search_controller_bloc.dart';

import '../utils/utils.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  List<CompanyProduct> _companyProducts = List.empty();

  SearchControllerBloc get _bloc =>
      BlocProvider.of<SearchControllerBloc>(context);

  @override
  void initState() {
    super.initState();
    _companyProducts = CompanyProductList.companyProducts();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'البحث',
          style: Theme.of(context).textTheme.displayLarge?.copyWith(
                fontSize: 18.0,
              ),
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(
          horizontal: 24.0,
          vertical: 10.0,
        ),
        physics: const BouncingScrollPhysics(),
        child: BlocConsumer<SearchControllerBloc, SearchControllerState>(
          listener: (context, state) {
            if (state is SearchProductState) {
              _companyProducts = state.companiesProduct;
            }
          },
          builder: (context, state) {
            return Column(
              children: [
                Row(
                  children: [
                    Expanded(
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(
                          8.0,
                        ),
                        child: TextField(
                          onChanged: (text) =>
                              _bloc.add(SearchProductEvent(text: text)),
                          style: Theme.of(context)
                              .textTheme
                              .displayLarge
                              ?.copyWith(fontSize: 14.0),
                          decoration: const InputDecoration(
                            hintText: 'البحث',
                            isDense: true,
                            contentPadding: EdgeInsetsDirectional.symmetric(
                              vertical: 16.0,
                              horizontal: 10.0,
                            ),
                            filled: true,
                            fillColor: AppColorScheme.greySearch,
                            border: InputBorder.none,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      width: 23.0,
                    ),
                    Container(
                      decoration: BoxDecoration(
                        color: AppColorScheme.greySearch,
                        borderRadius: BorderRadiusDirectional.circular(8.0),
                      ),
                      height: 48.0,
                      width: 42.0,
                      child: Center(
                        child: SvgPicture.asset(
                          AppImagePaths.filter,
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 20.0,
                ),
                GridViewCompanyProductWidget(
                  companyProducts: _companyProducts,
                  onTapProduct: (CompanyProduct product) {},
                  onTapFavorite: (CompanyProduct product) {},
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}

class GridViewCompanyProductWidget extends StatelessWidget {
  final List<CompanyProduct> companyProducts;
  final Function(CompanyProduct product) onTapFavorite;
  final Function(CompanyProduct product) onTapProduct;

  const GridViewCompanyProductWidget({
    super.key,
    required this.companyProducts,
    required this.onTapFavorite,
    required this.onTapProduct,
  });

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 0.7,
        mainAxisSpacing: 12.0,
        crossAxisSpacing: 29.0,
      ),
      itemCount: companyProducts.length,
      itemBuilder: (context, index) => _CategoryItemWidget(
        product: companyProducts[index],
        onTapFavorite: (CompanyProduct product) {},
        onTapProduct: (CompanyProduct product) {},
      ),
    );
  }
}

final class _CategoryItemWidget extends StatelessWidget {
  final CompanyProduct product;
  final Function(CompanyProduct product) onTapFavorite;
  final Function(CompanyProduct product) onTapProduct;

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
                  product.product.image,
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
                  product.product.isFavorite
                      ? Icons.favorite
                      : Icons.favorite_border,
                  color: product.product.isFavorite
                      ? Colors.red
                      : AppColorScheme.black,
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
  final CompanyProduct product;

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
          child: ConstrainedBox(
            constraints: const BoxConstraints(
              maxHeight: 18.0,
            ),
            child: Text(
              product.product.name,
              textAlign: TextAlign.start,
              overflow: TextOverflow.ellipsis,
              maxLines: 2,
              style: Theme.of(context).textTheme.displayLarge?.copyWith(
                    fontSize: 8.0,
                  ),
            ),
          ),
        ),
        const SizedBox(
          height: 10.0,
        ),
        Row(
          children: [
            Container(
              height: 18.0,
              width: 18.0,
              constraints: const BoxConstraints(
                maxHeight: 36.0,
                maxWidth: 36.0,
              ),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                image: DecorationImage(
                  fit: BoxFit.cover,
                  image: AssetImage(
                    product.company.image,
                  ),
                ),
              ),
            ),
            const SizedBox(
              width: 10.0,
            ),
            Text(
              product.company.name,
              style: Theme.of(context).textTheme.titleSmall?.copyWith(
                    fontSize: 8.0,
                  ),
            ),
          ],
        ),
        const SizedBox(
          height: 10.0,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              '${product.product.salaryAfterDiscount} دينار',
              style: Theme.of(context).textTheme.displayLarge?.copyWith(
                    fontSize: 12.0,
                  ),
            ),
            Text(
              '${product.product.salary} دينار',
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
