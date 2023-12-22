import '../index.dart';
import 'package:firebase_auth/firebase_auth.dart' as auth;

enum AppException {
  // Auth
  wrongPassword,
  tooManyRequests,
  invalidEmailAddress,
  emailInUse,
  accountDoesNotExist,
  weakPassword,

  // Other
  unknown,
  ;

  const AppException();

  factory AppException.createAndLog(String tag, dynamic e, StackTrace s) {
    final appException = AppException._create(e);

    if (appException == unknown) {
      // Log unknown exceptions
      logError('[$tag] unknown error', e, s);
    } else {
      logInfo('[$tag] $appException');
    }

    return appException;
  }

  factory AppException._create(dynamic e) {
    if (e is auth.FirebaseAuthException) {
      return switch (e.code) {
        'wrong-password' => wrongPassword,
        'too-many-requests' => tooManyRequests,
        'invalid-email' => invalidEmailAddress,
        'email-already-in-use' => emailInUse,
        'user-not-found' => accountDoesNotExist,
        'weak-password' => weakPassword,
        _ => unknown
      };
    }

    if (e is AppException) {
      return e;
    }

    return unknown;
  }

  String getText(AppLocalizations l10n) => switch (this) {
        AppException.wrongPassword => l10n.errorWrongPassword,
        AppException.tooManyRequests => l10n.errorTooManyRequests,
        AppException.invalidEmailAddress => l10n.errorInvalidEmailAddress,
        AppException.emailInUse => l10n.errorEmailAlreadyInUse,
        AppException.accountDoesNotExist => l10n.errorAccountNotExist,
        AppException.weakPassword => l10n.errorWeakPassword,
        AppException.unknown => l10n.errorUnknownError
      };
}
