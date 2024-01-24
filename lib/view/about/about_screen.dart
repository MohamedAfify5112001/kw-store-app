import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:kw_store_app/core/paths/app_image_paths.dart';

class AboutScreen extends StatelessWidget {
  const AboutScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsetsDirectional.symmetric(
        horizontal: 24.0,
        vertical: 14.0,
      ),
      child: SizedBox(
        width: double.infinity,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "عن التطبيق",
              style: Theme.of(context).textTheme.displayLarge?.copyWith(
                    fontSize: 24.0,
                  ),
            ),
            const SizedBox(
              height: 20.0,
            ),
            Center(
              child: SvgPicture.asset(
                AppImagePaths.kwLogo,
                width: 80.0,
                height: 80.0,
              ),
            ),
            const SizedBox(
              height: 42.3,
            ),
            Text(
              "عن الشركة",
              style: Theme.of(context).textTheme.displayLarge?.copyWith(
                    fontSize: 16.0,
                  ),
            ),
            const SizedBox(
              height: 12.0,
            ),
            ConstrainedBox(
              constraints: const BoxConstraints(
                maxWidth: 320.0,
              ),
              child: Text(
                "تطبيق 8Q Store معرض للشركات لحجز او شراء المنتجات من خلال شركات و متاجر في دولة الكويت",
                style: Theme.of(context).textTheme.displayLarge?.copyWith(
                      fontSize: 14.0,
                      height: 1.5,
                      color: const Color.fromRGBO(33, 33, 33, 1),
                    ),
              ),
            ),
            const SizedBox(
              height: 32.0,
            ),
            Text(
              "للتواصل",
              style: Theme.of(context).textTheme.displayLarge?.copyWith(
                    fontSize: 16.0,
                  ),
            ),
            const SizedBox(
              height: 16.0,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                AppImagePaths.pinterest,
                AppImagePaths.whatsapp,
                AppImagePaths.twitter,
                AppImagePaths.instagram,
                AppImagePaths.facebook,
              ]
                  .map(
                    (e) => SvgPicture.asset(
                      e,
                    ),
                  )
                  .toList(),
            ),
          ],
        ),
      ),
    );
  }
}
