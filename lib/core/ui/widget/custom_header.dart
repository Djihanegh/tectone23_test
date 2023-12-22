import 'package:tectone23_test/core/index.dart';

class CustomHeader extends StatelessWidget {
  const CustomHeader(
      {required this.title,
      super.key,
      this.fontWeight,
      this.color,
      this.padding});

  final String title;
  final FontWeight? fontWeight;
  final Color? color;
  final EdgeInsets? padding;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: padding ?? const EdgeInsets.only(left: 20, right: 20, top: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          DefaultTextStyle(
            style: darkTheme.textTheme.labelMedium!,
            child: AutoSizeText(
              title,
            ),
          ),
          GestureDetector(
              onTap: () => Navigator.pop(context),
              child: SvgPicture.asset(Images.remove)),
        ],
      ),
    );
  }
}
