import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:sard/core/data/story_data_repo.dart';
import 'package:sard/models/story_model.dart';

part 'story_event.dart';
part 'story_state.dart';

class StoryBloc extends Bloc<StoryEvent, StoryState> {
  //final dataSource = StoryDataRepo();
   final StoryDataRepo dataSource;

  StoryBloc(this.dataSource) : super(StoryInitial()) {
    on<LoadStoryById>((event, emit) async {
      emit(StoryLoading());

      try {
        final story = await dataSource.getStoryById(event.id);
        emit(StoryLoaded(story));
      } catch (e) {
        emit(StoryError("An error occurred while loading the story"));
      }
    });
  }
}
