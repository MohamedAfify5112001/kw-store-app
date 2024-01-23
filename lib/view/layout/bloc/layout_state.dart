part of 'layout_bloc.dart';

abstract class LayoutState extends Equatable {
  @override
  List<Object> get props => [
        identityHashCode(this),
      ];
}

final class LayoutInitial extends LayoutState {}

final class NavigateBottomNavigationState extends LayoutState {
  final int currentIndex;

  NavigateBottomNavigationState({required this.currentIndex});
}
