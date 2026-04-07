part of 'app_bloc.dart';

@immutable
sealed class AppState {}

class AppInitial extends AppState {}

class AppLoading extends AppState {}

class AppLoaded extends AppState {
  final List<CategoryModel> categories;
  final List<AuthorModel> authors;
  final List<StoryModel>? filteredStories;

  AppLoaded(this.categories, this.authors, {this.filteredStories});
}

class AppError extends AppState {
  final String message;
  AppError(this.message);
}
