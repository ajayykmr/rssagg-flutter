part of 'auth_bloc.dart';

@immutable
sealed class AuthEvent {}

//event to check if user is already logged in
//if yes emit auth success else emit auth initial
final class AuthStarted extends AuthEvent {}

final class AuthLoginRequested extends AuthEvent {
  final String email;
  final String password;

  AuthLoginRequested({
    required this.email,
    required this.password,
  });
}

final class AuthLogoutRequested extends AuthEvent {}

final class AuthSignUpRequested extends AuthEvent {
  final String email;
  final String password;

  AuthSignUpRequested({
    required this.email,
    required this.password,
  });
}