part of 'details_controller_bloc.dart';

abstract class DetailsControllerState {}

final class DetailsControllerInitial extends DetailsControllerState {}

final class AddProductToCartSuccessState extends DetailsControllerState {}

final class AddProductToCartFailureState extends DetailsControllerState {}
