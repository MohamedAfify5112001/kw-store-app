import 'package:equatable/equatable.dart';

final class Company extends Equatable {
  final String image;
  final String name;
  final int numberOfLikes;

  const Company({
    required this.image,
    required this.name,
    required this.numberOfLikes,
  });

  @override
  List<Object> get props => [image, name, numberOfLikes];
}
