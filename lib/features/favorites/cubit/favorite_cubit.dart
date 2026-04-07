import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';
import 'package:sard/models/story_model.dart';

part 'favorite_state.dart';

class FavoriteCubit extends Cubit<List<StoryModel>> {
  FavoriteCubit() : super([]);

  void favoriteButton(StoryModel story) {
    final current = List<StoryModel>.from(state);

    final exists = current.any((s) => s.id == story.id);

    if (exists) {
      current.removeWhere((s) => s.id == story.id);
    } else {
      current.add(story);
    }

    emit(current);
  }

  bool isFavorite(int id) {
    return state.any((s) => s.id == id);
  }
}