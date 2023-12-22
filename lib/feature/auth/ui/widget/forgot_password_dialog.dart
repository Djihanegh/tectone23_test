import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:tectone23_test/core/index.dart';
class ForgotPasswordDialog extends StatelessWidget {
  ForgotPasswordDialog({super.key});

  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(context.l10n.forgotYourPassword),
      content: Form(
        key: _formKey,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(context.l10n.forgotYourPasswordDescription),
            const SizedBox(height: 16),
            InputField.email(
              controller: _emailController,
              label: context.l10n.email,
              onFieldSubmitted: (_) => _submit(context),
            ),
          ],
        ),
      ),
      actions: [
        TextButton(
          style: TextButton.styleFrom(
            foregroundColor: context.colorScheme.onBackground,
          ),
          onPressed: () => context.pop(),
          child: Text(context.l10n.cancel),
        ),
        TextButton(
          onPressed: () => _submit(context),
          child: Text(context.l10n.send),
        ),
      ],
    );
  }

  Future<void> _submit(BuildContext context) async {
    if (!_formKey.currentState!.validate()) {
      return;
    }

    final email = _emailController.text.trim();
    context.pop(email);
  }
}
