import 'dart:convert';
import 'package:flutter/services.dart';
import 'package:sard/models/category_model.dart';
import 'package:sard/models/story_model.dart';

class StoryDataRepo {
  List<CategoryModel>? _storyDataRepo;

  Future<List<CategoryModel>> getCategories() async {
    if (_storyDataRepo != null) return _storyDataRepo!;

    final jsonString = await rootBundle.loadString('assets/data/stories.json');

    final List data = json.decode(jsonString);

    _storyDataRepo = data.map((e) => CategoryModel.fromMap(e)).toList();

    return _storyDataRepo!;
  }

  Future<StoryModel> getStoryById(int id) async {
    final categories = await getCategories();
    return categories
        .expand((c) => c.stories)
        .firstWhere(
          (story) => story.id == id,
          orElse: () => throw Exception("Story not found"),
        );
  }
}
