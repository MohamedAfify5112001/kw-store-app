import 'package:equatable/equatable.dart';

final class OnBoardingModel extends Equatable {
  final String image;
  final String title;
  final String desc;
  final int index;

  const OnBoardingModel({
    required this.image,
    required this.title,
    required this.desc,
    required this.index,
  });

  @override
  List<Object?> get props => [image, title, desc, index];
}

