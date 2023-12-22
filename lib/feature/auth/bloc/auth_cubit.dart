import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/exceptions/app_exception.dart';
import '../../../core/index.dart';
import '../repository/auth_repository.dart';

part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> with BlocLoggy {
  AuthCubit({
    required this.authRepository,
  }) : super(const AuthInitial());

  final AuthRepository authRepository;

  Future<void> signUpWithEmailAndPassword({
    required String email,
    required String password,
  }) {
    return _signIn(
      'signUpWithEmailAndPassword',
      AuthMethod.emailAndPassword,
      () => authRepository.signUpWithEmailAndPassword(
        email: email,
        password: password,
      ),
      isSignIn: false,
    );
  }

  Future<void> signInWithEmailAndPassword({
    required String email,
    required String password,
  }) {
    return _signIn(
      'signInWithEmailAndPassword',
      AuthMethod.emailAndPassword,
      () => authRepository.signInWithEmailAndPassword(
        email: email,
        password: password,
      ),
    );
  }

  Future<bool> resetPassword(String email) async {
    emit(const AuthLoading());
    try {
      await authRepository.resetPassword(email);
      emit(const AuthInitial());
      return true;
    } catch (e, s) {
      final exception = AppException.createAndLog(
        'resetPassword',
        e,
        s,
      );
      emit(AuthFailure(exception: exception));
      return false;
    }
  }

  Future<void> signInWithGoogle() {
    return _signIn(
      'signInWithGoogle',
      AuthMethod.google,
      authRepository.signInWithGoogle,
    );
  }

  Future<void> _signIn(
    String tag,
    AuthMethod method,
    Future<String?> Function() fn, {
    bool isSignIn = true,
  }) async {
    emit(const AuthLoading());
    try {
      final userId = await fn();
      if (userId == null) {
        loggy.info('$tag returned null userId');
        emit(const AuthInitial());
        return;
      }

      emit(AuthSuccess(userId));
    } catch (e, s) {
      final exception = AppException.createAndLog(tag, e, s);
      emit(AuthFailure(exception: exception));
    }
  }
}

enum AuthMethod {
  emailAndPassword('email-and-password'),
  google('google'),
  ;

  const AuthMethod(this.id);

  final String id;
}
