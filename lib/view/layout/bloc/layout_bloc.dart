import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'layout_event.dart';
part 'layout_state.dart';

class LayoutControllerBloc extends Bloc<LayoutEvent, LayoutState> {

  LayoutControllerBloc() : super(LayoutInitial()) {
    on<NavigateBottomNavigationEvent>(_onNavigateBottomNavigationEvent);
  }

  FutureOr<void> _onNavigateBottomNavigationEvent(
      NavigateBottomNavigationEvent event, Emitter<LayoutState> emit) {
    emit(NavigateBottomNavigationState(currentIndex: event.currentIndex));
  }
}
