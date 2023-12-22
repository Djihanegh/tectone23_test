import '../index.dart';


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


    if (e is AppException) {
      return e;
    }

    return unknown;
  }

  String getText(AppLocalizations l10n) => '';
}
