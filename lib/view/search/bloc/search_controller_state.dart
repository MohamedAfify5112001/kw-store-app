part of 'search_controller_bloc.dart';

abstract class SearchControllerState extends Equatable {
  @override
  List<Object> get props => [
        identityHashCode(this),
      ];
}

class SearchControllerInitial extends SearchControllerState {}

final class SearchProductState extends SearchControllerState {
  final List<CompanyProduct> companiesProduct;

  SearchProductState({required this.companiesProduct});
}
