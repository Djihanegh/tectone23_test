import 'package:tectone23_test/core/index.dart';

typedef LocalizedValidator = String? Function(
  BuildContext context,
  String? input,
);

abstract class Validators {
  Validators._();

  static LocalizedValidator? getValidator(
    BuildContext context,
    TextInputType? keyboardType,
  ) {
    return switch (keyboardType) {
      TextInputType.emailAddress => Validators.email,
      TextInputType.number => Validators.number,
      _ => null,
    };
  }

  static String? required(BuildContext context, String? input) {
    if (input?.trim().isEmpty ?? true) {
      return 'Required';
    }

    return null;
  }

  static String? requiredTyped<T>(BuildContext context, T? input) {
    if (input == null) {
      return 'Required';
    }

    return null;
  }

  static String? email(BuildContext context, String? email) {
    if (email == null || email.isEmpty) {
      return 'Required';
    }

    if (!email.isValidEmail()) {
      return 'Enter valid email';
    }

    return null;
  }

  static String? password(BuildContext context, String? password) {
    if (password == null || password.isEmpty) {
      return 'Required';
    }

    if (password.length < 6) {
      return 'Password must be at least 6 characters long';
    }

    if (!password.contains(RegExp('[A-Z]'))) {
      return 'Password must contain at least one capital letter';
    }

    return null;
  }

  static String? number(BuildContext context, String? input) {
    if (input == null) {
      return 'Required';
    }

    final number = num.tryParse(input);
    if (number == null) {
      return 'Enter valid number';
    }

    return null;
  }

  static String? positiveInteger(BuildContext context, String? input) {
    if (input == null) {
      return 'Required';
    }

    final integer = int.tryParse(input);
    if (integer == null || integer <= 0) {
      return 'Enter positive integer';
    }

    return null;
  }
}
