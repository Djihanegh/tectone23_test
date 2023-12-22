import 'package:flutter/material.dart';
import 'package:tectone23_test/core/index.dart';
class GoogleAuthButton extends StatelessWidget {
  const GoogleAuthButton({required this.onPressed, super.key});

  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return OutlinedButton.icon(
      style: OutlinedButton.styleFrom(
        foregroundColor: Colors.black,
        backgroundColor: Colors.white,
        side: const BorderSide(color: Colors.black),
        textStyle: context.textTheme.bodyMedium,
      ),
      icon: Image.asset(
        Images.google,
        width: 18,
        height: 18,
      ),
      label: Text(context.l10n.signInWithGoogle),
      onPressed: onPressed,
    );
  }
}
