part of 'app_bloc.dart';

@immutable
sealed class AppEvent {}

class LoadAppDataEvent extends AppEvent {}

class SearchStoriesEvent extends AppEvent {
  final String query;
  SearchStoriesEvent(this.query);
}
