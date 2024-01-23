import 'package:get_it/get_it.dart';
import 'package:kw_store_app/view/cart/bloc/cart_controller_bloc.dart';
import 'package:kw_store_app/view/details/bloc/details_controller_bloc.dart';
import 'package:kw_store_app/view/favorite/bloc/favorite_controller_bloc.dart';
import 'package:kw_store_app/view/home/bloc/home_controller_bloc.dart';
import 'package:kw_store_app/view/layout/bloc/layout_bloc.dart';

sealed class AppLocator {
  static final locator = GetIt.instance;

  static Future<void> initAppLocator() async => await Future.wait(
        [
          _initBlocLocator(),
        ],
      );

  static Future<void> _initBlocLocator() async {
    locator.registerFactory<LayoutControllerBloc>(() => LayoutControllerBloc());
    locator.registerFactory<HomeControllerBloc>(() => HomeControllerBloc());
    locator.registerFactory<DetailsControllerBloc>(() => DetailsControllerBloc());
    locator.registerFactory<CartControllerBloc>(() => CartControllerBloc());
    locator.registerFactory<FavoriteControllerBloc>(
        () => FavoriteControllerBloc());
  }
}
