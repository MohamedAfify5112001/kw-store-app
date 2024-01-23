import 'package:flutter/material.dart';
import 'package:kw_store_app/core/color/app_color.dart';

import '../../../model/product.dart';

class OffersProductsWidget extends StatelessWidget {
  final List<Product> offers;

  const OffersProductsWidget({
    super.key,
    required this.offers,
  });

  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints: const BoxConstraints(maxHeight: 88.0),
      child: ListView.separated(
        physics: const BouncingScrollPhysics(),
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) => OfferItemWidget(offer: offers[index]),
        separatorBuilder: (context, index) => const SizedBox(
          width: 12.0,
        ),
        itemCount: offers.length,
      ),
    );
  }
}

class OfferItemWidget extends StatelessWidget {
  final Product offer;

  const OfferItemWidget({
    super.key,
    required this.offer,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsetsDirectional.symmetric(
        vertical: 12.0,
        horizontal: 9.0,
      ),
      decoration: BoxDecoration(
        color: AppColorScheme.white,
        borderRadius: BorderRadiusDirectional.circular(
          8.0,
        ),
        border: Border.all(
          color: AppColorScheme.blackWithAlphaThird,
        ),
      ),
      child: Directionality(
        textDirection: TextDirection.ltr,
        child: Row(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(8.0),
              child: Image.network(
                offer.image,
                width: 49.0,
                height: 64.0,
                fit: BoxFit.contain,
              ),
            ),
            const SizedBox(
              width: 10.0,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ConstrainedBox(
                  constraints: const BoxConstraints(
                    maxWidth: 107.0,
                  ),
                  child: Text(
                    offer.name,
                    maxLines: 2,
                    style: Theme.of(context).textTheme.displayLarge?.copyWith(
                          fontSize: 9.0,
                          overflow: TextOverflow.ellipsis,
                        ),
                  ),
                ),
                const SizedBox(
                  height: 5.0,
                ),
                Directionality(
                  textDirection: TextDirection.rtl,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        '${offer.salaryAfterDiscount} دينار',
                        style: Theme.of(context)
                            .textTheme
                            .displayLarge
                            ?.copyWith(
                              fontSize: 12.0,
                            ),
                      ),
                      const SizedBox(width: 20.0,),
                      Text(
                        '${offer.salary} دينار',
                        style: Theme.of(context)
                            .textTheme
                            .displayLarge
                            ?.copyWith(
                              decoration: TextDecoration.lineThrough,
                              fontSize: 12.0,
                              color: AppColorScheme.greyCategory,
                            ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
