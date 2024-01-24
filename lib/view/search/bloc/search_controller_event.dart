part of 'search_controller_bloc.dart';

abstract class SearchControllerEvent extends Equatable {
  const SearchControllerEvent();
}

final class SearchProductEvent extends SearchControllerEvent {
  final String text;

  const SearchProductEvent({
    required this.text,
  });

  @override
  List<Object> get props => [text];
}
