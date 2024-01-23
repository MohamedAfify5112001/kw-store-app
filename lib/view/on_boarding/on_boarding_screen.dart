import 'package:flutter/material.dart';
import 'package:kw_store_app/core/routes/app_routes.dart';
import 'package:kw_store_app/core/utils/on_boarding_utils/on_boarding_utils.dart';
import 'package:kw_store_app/model/on_boarding_model.dart';
import 'package:kw_store_app/view/on_boarding/widget/on_boarding_widget.dart';

class OnBoardingScreen extends StatefulWidget {
  const OnBoardingScreen({super.key});

  @override
  State<OnBoardingScreen> createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen>
    with OnBoardingDataMixin {
  List<OnBoardingModel> _onBoardingData = List.empty();
  final PageController _pageController = PageController(initialPage: 0);

  @override
  void initState() {
    super.initState();
    _onBoardingData = List.of(getOnBoardingData);
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      child: Scaffold(
        body: SafeArea(
          child: PageView.builder(
            controller: _pageController,
            itemBuilder: (context, index) => OnBoardingWidget(
              onBoardingModel: _onBoardingData[index],
              onTapSkipped: () {
                Navigator.pushNamedAndRemoveUntil(
                  context,
                  AppRoutes.layout,
                  (route) => false,
                );
              },
              onTap: (int page) {
                if (page != 2) {
                  _pageController.animateToPage(
                    page + 1,
                    duration: const Duration(seconds: 1),
                    curve: Curves.easeInOut,
                  );
                }
              },
              pageController: _pageController,
            ),
            itemCount: _onBoardingData.length,
            physics: const NeverScrollableScrollPhysics(),
          ),
        ),
      ),
    );
  }
}
