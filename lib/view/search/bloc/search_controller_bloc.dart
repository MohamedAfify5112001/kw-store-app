import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:kw_store_app/model/company_product.dart';
import 'package:kw_store_app/view/utils/utils.dart';

part 'search_controller_event.dart';

part 'search_controller_state.dart';

class SearchControllerBloc
    extends Bloc<SearchControllerEvent, SearchControllerState> {
  SearchControllerBloc() : super(SearchControllerInitial()) {
    on<SearchProductEvent>(_onSearchProductEvent);
  }

  final List<CompanyProduct> _companyProducts =
      CompanyProductList.companyProducts();

  FutureOr<void> _onSearchProductEvent(
      SearchProductEvent event, Emitter<SearchControllerState> emit) {
    final searchedCompanyProducts = _companyProducts
        .where((element) =>
            element.product.name.toLowerCase().contains(event.text.toLowerCase()))
        .toList();
    if (event.text.isNotEmpty) {
      if (searchedCompanyProducts.isNotEmpty) {
        emit(SearchProductState(companiesProduct: searchedCompanyProducts));
      } else {
        emit(SearchProductState(companiesProduct: const []));
      }
    } else {
      emit(SearchProductState(companiesProduct: _companyProducts));
    }
  }
}
