import 'package:flutter/material.dart';
import 'package:kw_store_app/core/color/app_color.dart';
import 'package:kw_store_app/model/on_boarding_model.dart';
import 'package:kw_store_app/view/on_boarding/widget/on_boarding_data_widget.dart';

class OnBoardingWidget extends StatelessWidget {
  final OnBoardingModel onBoardingModel;
  final PageController pageController;
  final void Function(int) onTap;
  final void Function() onTapSkipped;

  const OnBoardingWidget(
      {super.key,
      required this.onBoardingModel,
      required this.pageController,
      required this.onTap,
      required this.onTapSkipped});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: Stack(
            children: [
              Image.asset(
                onBoardingModel.image,
                fit: BoxFit.cover,
                width: double.infinity,
              ),
              PositionedDirectional(
                start: 10.0,
                top: 20.0,
                child: GestureDetector(
                  onTap: onTapSkipped,
                  child: Container(
                    width: 72.0,
                    padding: const EdgeInsetsDirectional.symmetric(
                      vertical: 4.0,
                    ),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(13.0),
                      color: AppColorScheme.blackWithAlpha,
                    ),
                    child: Center(
                      child: Text(
                        "تخطي",
                        style: Theme.of(context).textTheme.titleSmall?.copyWith(
                              color: AppColorScheme.white,
                            ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
        Expanded(
          child: OnBoardingDataWidget(
            pageController: pageController,
            onTap: onTap,
            onBoardingModel: onBoardingModel,
          ),
        ),
      ],
    );
  }
}
