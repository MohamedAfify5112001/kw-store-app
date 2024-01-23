import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:kw_store_app/core/color/app_color.dart';
import 'package:kw_store_app/core/paths/app_image_paths.dart';

class HomeBannerWidget extends StatelessWidget {
  const HomeBannerWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: 105,
      decoration: BoxDecoration(
        borderRadius: BorderRadiusDirectional.circular(8),
        gradient: const LinearGradient(
          begin: Alignment.centerLeft,
          end: Alignment.centerRight,
          colors: [
            AppColorScheme.black,
            Color(0x00000000),
          ],
        ),
      ),
      padding: const EdgeInsetsDirectional.symmetric(
        horizontal: 25.0,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Image.asset(
            AppImagePaths.headPhone,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'BLACK FRIDAY',
                style: Theme.of(context).textTheme.displayLarge?.copyWith(
                      fontSize: 20.0,
                      color: AppColorScheme.white,
                    ),
              ),
              Text(
                '30% off for all items',
                style: Theme.of(context).textTheme.titleSmall?.copyWith(
                      fontSize: 16.0,
                      color: AppColorScheme.white,
                    ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
