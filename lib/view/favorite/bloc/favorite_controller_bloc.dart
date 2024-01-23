import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:kw_store_app/core/utils/extension/extension.dart';
import 'package:kw_store_app/local/hive_db/init_hive.dart';
import 'package:kw_store_app/model/product.dart';

part 'favorite_controller_event.dart';

part 'favorite_controller_state.dart';

class FavoriteControllerBloc
    extends Bloc<FavoriteControllerEvent, FavoriteControllerState> {
  FavoriteControllerBloc() : super(FavoriteControllerInitial()) {
    on<FetchFavoriteProductsEvent>(_onFetchFavoriteProductsEvent);
    on<DeleteFavoriteProductsEvent>(_onDeleteFavoriteProductsEvent);
  }

  FutureOr<void> _onFetchFavoriteProductsEvent(
      FetchFavoriteProductsEvent event, Emitter<FavoriteControllerState> emit) {
    try {
      final List<Product> favorites =
          Boxes.favoriteBox.values.toList().toProducts();
      emit(FetchFavoriteProductsSuccessState(favorites: favorites));
    } catch (_) {
      emit(FetchFavoriteProductsErrorState());
    }
  }

  FutureOr<void> _onDeleteFavoriteProductsEvent(
      DeleteFavoriteProductsEvent event,
      Emitter<FavoriteControllerState> emit) async {
    try {
      await Boxes.favoriteBox.delete(event.deletedFavorite.name);
      emit(DeleteFavoriteProductsSuccessState());
    } catch (_) {
      emit(DeleteFavoriteProductsFailureState());
    }
  }
}
