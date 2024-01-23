part of 'favorite_controller_bloc.dart';

abstract class FavoriteControllerEvent {}

final class FetchFavoriteProductsEvent extends FavoriteControllerEvent {}

final class DeleteFavoriteProductsEvent extends FavoriteControllerEvent {
  final Product deletedFavorite;

  DeleteFavoriteProductsEvent({required this.deletedFavorite});
}
