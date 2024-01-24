import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:kw_store_app/core/color/app_color.dart';
import 'package:kw_store_app/core/locator/app_locator.dart';
import 'package:kw_store_app/core/routes/app_routes.dart';
import 'package:kw_store_app/core/routes/route_manager.dart';
import 'package:kw_store_app/core/theme/app_theme.dart';
import 'package:kw_store_app/view/cart/bloc/cart_controller_bloc.dart';
import 'package:kw_store_app/view/details/bloc/details_controller_bloc.dart';
import 'package:kw_store_app/view/favorite/bloc/favorite_controller_bloc.dart';
import 'package:kw_store_app/view/home/bloc/home_controller_bloc.dart';
import 'package:kw_store_app/view/layout/bloc/layout_bloc.dart';
import 'package:kw_store_app/view/search/bloc/search_controller_bloc.dart';
import 'package:kw_store_app/view/search/bloc/search_controller_bloc.dart';

class KwStoreApp extends StatelessWidget {
  const KwStoreApp({super.key});

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: const SystemUiOverlayStyle(
        statusBarColor: AppColorScheme.white,
        statusBarIconBrightness: Brightness.dark,
        systemNavigationBarColor: AppColorScheme.black,
        systemNavigationBarIconBrightness: Brightness.light,
      ),
      child: MultiBlocProvider(
        providers: [
          BlocProvider<LayoutControllerBloc>(
            create: (context) => AppLocator.locator<LayoutControllerBloc>(),
          ),
          BlocProvider<HomeControllerBloc>(
            create: (context) => AppLocator.locator<HomeControllerBloc>(),
          ),
          BlocProvider<FavoriteControllerBloc>(
            create: (context) => AppLocator.locator<FavoriteControllerBloc>(),
          ),
          BlocProvider<DetailsControllerBloc>(
            create: (context) => AppLocator.locator<DetailsControllerBloc>(),
          ),
          BlocProvider<CartControllerBloc>(
            create: (context) => AppLocator.locator<CartControllerBloc>(),
          ),
          BlocProvider<SearchControllerBloc>(
            create: (context) => AppLocator.locator<SearchControllerBloc>(),
          ),
        ],
        child: MaterialApp(
          theme: AppTheme.appTheme,
          debugShowCheckedModeBanner: false,
          localizationsDelegates: const [
            GlobalMaterialLocalizations.delegate,
            GlobalWidgetsLocalizations.delegate,
            GlobalCupertinoLocalizations.delegate,
          ],
          initialRoute: AppRoutes.splash,
          onGenerateRoute: AppRouteManager.getAppRoutes,
          supportedLocales: const [
            Locale('ar'),
          ],
          locale: const Locale('ar'),
        ),
      ),
    );
  }
}
