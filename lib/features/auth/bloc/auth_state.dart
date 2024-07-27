part of 'auth_bloc.dart';

@immutable
sealed class AuthState {}

//state where auth has not started
final class AuthInitial extends AuthState {}

//state where user is logged in
final class AuthSuccess extends AuthState{
  final User user;
  AuthSuccess(this.user);
}

//state where user login fails
final class AuthFailure extends AuthState{
  final String error;
  AuthFailure(this.error);
}

//state where user is being authenticated
final class AuthLoading extends AuthState{}

final class AuthUserNotLoggedIn extends AuthState{}