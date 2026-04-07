import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:sard/core/data/story_data_repo.dart';
import 'package:sard/core/data/author_data_repo.dart';
import 'package:sard/models/category_model.dart';
import 'package:sard/models/author_model.dart';
import 'package:sard/models/story_model.dart';

part 'app_event.dart';
part 'app_state.dart';

class AppBloc extends Bloc<AppEvent, AppState> {
  final StoryDataRepo storyRepo;
  final AuthorDataRepo authorRepo;

  AppBloc(this.storyRepo, this.authorRepo) : super(AppInitial()) {
    on<LoadAppDataEvent>((event, emit) async {
      emit(AppLoading());

      try {
        final categories = await storyRepo.getCategories();
        final authors = await authorRepo.getAuthors();

        emit(AppLoaded(categories, authors));
      } catch (e) {
        emit(AppError("Failed to load data"));
      }
    });
    
    on<SearchStoriesEvent>((event, emit) {
      if (state is AppLoaded) {
        final currentState = state as AppLoaded;

        final allStories = currentState.categories
            .expand((c) => c.stories)
            .toList();

        final filteredStories = event.query.isEmpty
            ? allStories
            : allStories
                  .where(
                    (story) => story.title.toLowerCase().contains(
                      event.query.toLowerCase(),
                    ),
                  )
                  .toList();

        emit(
          AppLoaded(
            currentState.categories,
            currentState.authors,
            filteredStories: filteredStories,
          ),
        );
      }
    });
  }
}
