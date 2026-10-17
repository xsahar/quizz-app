import 'question.dart';

class Category {
  const Category({
    required this.name,
    required this.imageAsset,
    required this.questions,
  });

  final String name;
  final String imageAsset;
  final List<Question> questions;
}
