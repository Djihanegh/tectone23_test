import '../../index.dart';

class HorizontalLine extends StatelessWidget {
  const HorizontalLine({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 0.5,
      width: sw!,
      color: darkTheme.colorScheme.primaryContainer,
    );
  }
}
