import 'package:tectone23_test/core/index.dart';

class LabeledTextButton extends StatelessWidget {
  const LabeledTextButton({
    required this.action,
    required this.onTap,
    this.label,
    super.key,
  });

  final String? label;
  final String action;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onTap,
      child: RichText(
        textAlign: TextAlign.center,
        text: TextSpan(
          text: label == null ? '' : '$label ',
          style: context.textTheme.labelMedium,
          children: [
            TextSpan(
              text: action,
              style: context.textTheme.labelMedium!.copyWith(
                color: context.colorScheme.primary,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
