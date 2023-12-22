import '../../../../core/index.dart';

class TransactionBar extends StatelessWidget {
  const TransactionBar({super.key, required this.title});

  final String title;

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.only(top: 20),
        child: Container(
          height: 40,
          padding: EdgeInsets.only(left: sw! * 0.045, top: sh! * 0.01),
          width: sw,
          color: darkTheme.colorScheme.secondaryContainer,
          child: AutoSizeText(
            title,
            style: darkTheme.textTheme.titleSmall!.copyWith(
              color: darkTheme.colorScheme.primaryContainer,
              fontWeight: FontWeight.w700,
            ),
          ),
        ));
  }
}
