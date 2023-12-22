import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tectone23_test/core/index.dart';

import '../../../feature/auth/bloc/auth_cubit.dart';
import '../../../feature/auth/ui/widget/forgot_password_dialog.dart';

sealed class Dialogs {
  const Dialogs._();

  static Future<void> showForgotPasswordDialog(BuildContext context) async {
    final email = await showDialog<String>(
      context: context,
      builder: (context) => ForgotPasswordDialog(),
    );

    if (!context.mounted) {
      return;
    }

    if (email == null) {
      return;
    }

    final result = await context.read<AuthCubit>().resetPassword(email);
    if (!context.mounted) {
      return;
    }

    if (result) {
      context.showSnackBarMessage(context.l10n.resetPasswordEmailSent);
    }
  }
}
