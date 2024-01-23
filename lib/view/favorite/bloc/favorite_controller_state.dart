part of 'favorite_controller_bloc.dart';

abstract class FavoriteControllerState extends Equatable {
  @override
  List<Object> get props => [identityHashCode(this)];
}

class FavoriteControllerInitial extends FavoriteControllerState {}

final class FetchFavoriteProductsSuccessState extends FavoriteControllerState {
  final List<Product> favorites;

  FetchFavoriteProductsSuccessState({required this.favorites});

  @override
  List<Object> get props => [
        favorites,
        identityHashCode(this),
      ];
}

final class FetchFavoriteProductsErrorState extends FavoriteControllerState {}

final class DeleteFavoriteProductsSuccessState
    extends FavoriteControllerState {}

final class DeleteFavoriteProductsFailureState
    extends FavoriteControllerState {}
