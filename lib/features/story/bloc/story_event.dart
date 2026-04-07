part of 'story_bloc.dart';

@immutable
sealed class StoryEvent {}

class LoadStoryById extends StoryEvent {
  final int id;

  LoadStoryById(this.id);

}
