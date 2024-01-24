import 'package:flutter/material.dart';
import 'package:kw_store_app/core/routes/app_routes.dart';
import 'package:kw_store_app/view/cart/cart_screen.dart';
import 'package:kw_store_app/view/details/details_screen.dart';
import 'package:kw_store_app/view/layout/layout_screen.dart';
import 'package:kw_store_app/view/on_boarding/on_boarding_screen.dart';
import 'package:kw_store_app/view/search/search_screen.dart';
import 'package:kw_store_app/view/splash/splash_screen.dart';
import 'package:page_transition/page_transition.dart';

sealed class AppRouteManager {
  static Route getAppRoutes(RouteSettings settings) {
    switch (settings.name) {
      case AppRoutes.splash:
        return _pageTransitionForScreen(
          screen: const SplashScreen(),
          settings: settings,
        );
      case AppRoutes.onBoarding:
        return _pageTransitionForScreen(
          screen: const OnBoardingScreen(),
          settings: settings,
        );
      case AppRoutes.layout:
        return _pageTransitionForScreen(
          screen: const LayoutScreen(),
          settings: settings,
        );
      case AppRoutes.details:
        return _pageTransitionForScreen(
          screen: const DetailsScreen(),
          settings: settings,
        );
      case AppRoutes.cart:
        return _pageTransitionForScreen(
          screen: const CartScreen(),
          settings: settings,
        );
      case AppRoutes.search:
        return _pageTransitionForScreen(
          screen: const SearchScreen(),
          settings: settings,
        );
      default:
        return _pageTransitionForScreen(
          screen: const SplashScreen(),
          settings: settings,
        );
    }
  }

  static PageTransition _pageTransitionForScreen(
          {required Widget screen, required RouteSettings settings}) =>
      PageTransition(
        child: screen,
        type: PageTransitionType.fade,
        settings: settings,
        curve: Curves.easeInOut,
        duration: const Duration(milliseconds: 700),
      );
}
