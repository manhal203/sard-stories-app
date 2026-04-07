part of 'author_bloc.dart';

@immutable
sealed class AuthorEvent {}

class LoadAuthorById extends AuthorEvent {
  final int id;

  LoadAuthorById(this.id);
}

