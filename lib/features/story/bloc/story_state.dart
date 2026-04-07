part of 'story_bloc.dart';

@immutable
sealed class StoryState {}

final class StoryInitial extends StoryState {}

class StoryLoading extends StoryState {}

class StoryLoaded extends StoryState {
  final StoryModel story;

  StoryLoaded(this.story);
}

class StoryError extends StoryState {
  final String message;

  StoryError(this.message);
}