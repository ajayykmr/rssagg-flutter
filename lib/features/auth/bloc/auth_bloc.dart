import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rssagg_flutter/features/auth/data/repository/auth_repository.dart';
import 'package:rssagg_flutter/models/user.dart';

import '../data/repository/current_user_repository.dart';

part 'auth_event.dart';

part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final AuthRepository authRepository;
  final CurrentUserRepository currentUserRepository;

  AuthBloc({
    required this.currentUserRepository,
    required this.authRepository,
  }) : super(AuthInitial()) {
    on<AuthLoginRequested>(_onAuthLoginRequested);
    on<AuthLogoutRequested>(_onAuthLogoutRequested);
    on<AuthStarted>(_onAppStarted);

  }

  void _onAuthLogoutRequested(AuthLogoutRequested event,
      Emitter<AuthState> emit) async {
    emit(AuthLoading());
    try {
      currentUserRepository.logoutCurrentUser();
    } catch (e) {
      emit(AuthFailure(e.toString()));
    }
  }

  void _onAuthLoginRequested(AuthLoginRequested event,
      Emitter<AuthState> emit) async {

    emit(AuthLoading());
    try {
      final email = event.email;
      final password = event.password;

      final user = await authRepository.login(email, password);

      try {
        await currentUserRepository.saveCurrentUser(user);
      } catch (e) {
        print(e);
      }

      emit(AuthSuccess(user));
    } catch (e){
      print(e);
      emit(AuthFailure(e.toString()));
    }



  }


  void _onAppStarted(AuthStarted event, Emitter<AuthState> emit) async {
    emit(AuthLoading());

    //check if user is already logged in
    try {
      final user = await currentUserRepository.getCurrentUser();
      emit(AuthSuccess(user));
    } catch (e) {
      print(e);
      emit(AuthUserNotLoggedIn());
    }

  }
// @override
// void onChange(Change<AuthState> change) {
//   super.onChange(change);
//   print('AuthBloc - Change - $change');
// }
//
// @override
// void onError(Object error, StackTrace stackTrace) {
//   super.onError(error, stackTrace);
//   print('AuthBloc - Error - $error');
// }
//
// @override
// void onTransition(Transition<AuthEvent, AuthState> transition) {
//   super.onTransition(transition);
//
//   print('AuthBloc - Transition - $transition');
// }


}
