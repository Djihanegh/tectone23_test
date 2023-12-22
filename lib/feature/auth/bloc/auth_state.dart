part of 'auth_cubit.dart';

@immutable
sealed class AuthState {
  const AuthState();
}

class AuthInitial extends AuthState {
  const AuthInitial();
}

class AuthLoading extends AuthState {
  const AuthLoading();
}

class AuthSuccess extends AuthState {
  const AuthSuccess(this.userId);

  final String userId;
}

class AuthFailure extends AuthState {
  const AuthFailure({required this.exception});

  final AppException exception;
}
