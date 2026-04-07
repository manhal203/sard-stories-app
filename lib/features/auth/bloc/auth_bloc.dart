import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:sard/features/auth/repository/auth_repository.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final AuthRepository authRepository;
  AuthBloc(this.authRepository) : super(AuthInitial()) {
    on<LoginEvent>(loginMethod);
    on<SignUpEvent>(signUpMethod);
  }
  FutureOr<void> loginMethod(LoginEvent event, Emitter<AuthState> emit) async {
    emit(LoadingState());

    (await authRepository.login(
      email: event.email,
      password: event.password,
    )).fold(
      (onLeft) {
        emit(ErrorState(message: onLeft));
      },
      (onRight) {
        emit(SuccessState());
      },
    );
  }

  FutureOr<void> signUpMethod(
    SignUpEvent event,
    Emitter<AuthState> emit,
  ) async {
    emit(LoadingState());

    (await authRepository.signUp(
      email: event.email,
      password: event.password,
      name: event.name,
      phone: event.phone,
      birthDate: event.birthDate,
    )).fold(
      (onLeft) {
        emit(ErrorState(message: onLeft));
      },
      (onRight) {
        emit(SuccessState());
      },
    );
  }
}
