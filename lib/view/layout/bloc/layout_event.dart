part of 'layout_bloc.dart';

abstract class LayoutEvent extends Equatable {
  const LayoutEvent();
}

final class NavigateBottomNavigationEvent extends LayoutEvent {
  final int currentIndex;

  const NavigateBottomNavigationEvent({required this.currentIndex});

  @override
  List<Object?> get props => [currentIndex];
}
