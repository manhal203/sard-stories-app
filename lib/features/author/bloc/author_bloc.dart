import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:sard/core/data/author_data_repo.dart';
import 'package:sard/models/author_model.dart';

part 'author_event.dart';
part 'author_state.dart';

class AuthorBloc extends Bloc<AuthorEvent, AuthorState> {
  final AuthorDataRepo dataSource;

  AuthorBloc(this.dataSource) : super(AuthorInitial()) {
    on<LoadAuthorById>((event, emit) async {
      emit(AuthorLoading());
      try {
        final author = await dataSource.getAuthorById(event.id);
        emit(AuthorLoaded(author));
      } catch (e) {
        emit(AuthorError("An error occurred while loading the author"));
      }
    });
  }
}
