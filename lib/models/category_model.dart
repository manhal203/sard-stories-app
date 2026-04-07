import 'package:sard/models/story_model.dart';

class CategoryModel {
  final String category;
  final List<StoryModel> stories;

  CategoryModel({required this.category, required this.stories});

  factory CategoryModel.fromMap(Map<String, dynamic> json) {
    return CategoryModel(
      category: json['category'],
      stories: (json['stories'] as List)
          .map((e) => StoryModel.fromMap(e))
          .toList(),
    );
  }
}
