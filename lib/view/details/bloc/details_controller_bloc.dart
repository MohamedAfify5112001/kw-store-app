import 'dart:async';
import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:kw_store_app/core/utils/extension/extension.dart';
import 'package:kw_store_app/local/isar_db/isar_db.dart';
import 'package:kw_store_app/model/product.dart';

part 'details_controller_event.dart';

part 'details_controller_state.dart';

class DetailsControllerBloc
    extends Bloc<DetailsControllerEvent, DetailsControllerState> {
  DetailsControllerBloc() : super(DetailsControllerInitial()) {
    on<AddProductToCartEvent>(_onAddProductToCartSuccessEvent);
  }

  FutureOr<void> _onAddProductToCartSuccessEvent(
      AddProductToCartEvent event, Emitter<DetailsControllerState> emit) async {
    try {
      final CartIsarDatabase cartIsarDatabase = CartIsarDatabase();
      await cartIsarDatabase.add(event.product.toLocalProductCart());
      emit(AddProductToCartSuccessState());
    } catch (error) {
      log("Error =>>>>>>>>> ${error.toString()}");
      emit(AddProductToCartFailureState());
    }
  }
}
