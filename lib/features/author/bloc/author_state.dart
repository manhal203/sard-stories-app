part of 'author_bloc.dart';

@immutable
sealed class AuthorState {}

final class AuthorInitial extends AuthorState {}

class AuthorLoading extends AuthorState {}

class AuthorLoaded extends AuthorState {
  final AuthorModel author;

  AuthorLoaded(this.author);
}

class AuthorError extends AuthorState {
  final String message;

  AuthorError(this.message);
}
