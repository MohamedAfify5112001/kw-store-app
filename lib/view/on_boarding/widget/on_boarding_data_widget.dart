import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:kw_store_app/core/color/app_color.dart';
import 'package:kw_store_app/core/paths/app_image_paths.dart';
import 'package:kw_store_app/model/on_boarding_model.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class OnBoardingDataWidget extends StatelessWidget {
  final PageController pageController;
  final OnBoardingModel onBoardingModel;
  final Function(int) onTap;

  const OnBoardingDataWidget({
    super.key,
    required this.onBoardingModel,
    required this.pageController,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: AppColorScheme.white,
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SvgPicture.asset(
            AppImagePaths.kwLogo,
            fit: BoxFit.scaleDown,
            width: 80.0,
            height: 80.0,
          ),
          const SizedBox(
            height: 24.0,
          ),
          Text(
            onBoardingModel.title,
            style: Theme.of(context).textTheme.displayLarge,
          ),
          const SizedBox(
            height: 12.0,
          ),
          ConstrainedBox(
            constraints: const BoxConstraints(
              maxWidth: 273.0,
              maxHeight: 37.0,
            ),
            child: Text(
              onBoardingModel.desc,
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.titleSmall?.copyWith(
                    fontSize: 12.0,
                    color: AppColorScheme.grey,
                  ),
            ),
          ),
          const SizedBox(
            height: 30.0,
          ),
          SmoothPageIndicator(
            controller: pageController, // PageController
            count: 3,
            effect: const ExpandingDotsEffect(
              dotWidth: 20.0,
              dotHeight: 6.0,
              radius: 5.0,
              expansionFactor: 1.8,
              dotColor: AppColorScheme.greyIndicator,
              activeDotColor: AppColorScheme.black,
              spacing: 5.0,
            ), // your pref// erred effect
            onDotClicked: (index) {},
          ),
          const SizedBox(
            height: 24.0,
          ),
          GestureDetector(
            onTap: () {
              onTap(onBoardingModel.index);
            },
            child: Container(
              width: 62.12,
              height: 62.12,
              decoration: const BoxDecoration(
                color: AppColorScheme.black,
                shape: BoxShape.circle,
              ),
              child: SvgPicture.asset(
                AppImagePaths.arrowRight,
                fit: BoxFit.scaleDown,
              ),
            ),
          )
        ],
      ),
    );
  }
}
