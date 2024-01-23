import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:kw_store_app/core/color/app_color.dart';
import 'package:kw_store_app/core/paths/app_image_paths.dart';

class HomeSearchWidget extends StatelessWidget {
  const HomeSearchWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        Expanded(
          child: Container(
            decoration: BoxDecoration(
              color: AppColorScheme.greySearch,
              borderRadius: BorderRadiusDirectional.circular(8.0),
            ),
            padding: const EdgeInsetsDirectional.symmetric(
              vertical: 10.0,
              horizontal: 20.0,
            ),
            child: Row(
              children: [
                SvgPicture.asset(
                  AppImagePaths.search,
                ),
                const SizedBox(
                  width: 8.0,
                ),
                Text(
                  'بحث',
                  style: Theme.of(context).textTheme.titleLarge?.copyWith(
                      fontSize: 14.0,
                      color: AppColorScheme.blackWithAlphaSecond),
                ),
              ],
            ),
          ),
        ),
        const SizedBox(
          width: 12.0,
        ),
        Container(
          decoration: BoxDecoration(
            color: AppColorScheme.greySearch,
            borderRadius: BorderRadiusDirectional.circular(8.0),
          ),
          padding: const EdgeInsetsDirectional.symmetric(
            vertical: 10.0,
            horizontal: 20.0,
          ),
          child: Center(
            child: SvgPicture.asset(
              AppImagePaths.filter,
            ),
          ),
        ),
      ],
    );
  }
}
