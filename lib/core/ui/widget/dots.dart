import '../../index.dart';

AnimatedContainer buildDot({int? index, int? currentPage}) {
  return AnimatedContainer(
    duration: Constants.kAnimationDuration,
    margin: const EdgeInsets.only(right: 5),
    height: 10,
    width: currentPage == index ? 30 : 10,
    decoration: BoxDecoration(
      color: currentPage == index
          ? darkTheme.indicatorColor
          : darkTheme.primaryColor,
      borderRadius: BorderRadius.circular(20),
    ),
  );
}
