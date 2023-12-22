import '../../index.dart';

class CustomButton extends StatelessWidget {
  final String? title;
  final Color? color;
  final Color? titleColor;
  final VoidCallback? onPressed;
  final EdgeInsets? padding;
  final EdgeInsets? generalPadding;

  final double? height;
  final double? width;
  final BoxBorder? border;
  final FontWeight? fontWeight;
  final String? icon;

  const CustomButton({
    Key? key,
    this.title,
    this.color,
    this.generalPadding,
    this.titleColor,
    this.height,
    this.width,
    this.onPressed,
    this.padding,
    this.border,
    this.fontWeight,
    this.icon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    screenSizeInit(context);
    return Padding(
        padding: generalPadding ??
            const EdgeInsets.symmetric(horizontal: 8, vertical: 20),
        child: GestureDetector(
          onTap: () => onPressed!(),
          child: Container(
              padding: padding ?? const EdgeInsets.all(0),
              height: 50,
              decoration: BoxDecoration(
                  color: color,
                  borderRadius: BorderRadius.circular(29),
                  border: border ?? Border.all(color: Colors.transparent)),
              alignment: Alignment.center,
              child: DefaultTextStyle(
                style: /* TextStyles.dmSans.copyWith(
                    color: titleColor,
                    fontSize: 16,
                    fontWeight: fontWeight ?? FontWeight.w700)*/
                    darkTheme.textTheme.labelMedium!,
                child: icon != null
                    ? Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Image.asset(icon!),
                          const SizedBox(
                            width: 5,
                          ),
                          AutoSizeText(
                            title!,
                            /* style: TextStyles.dmSans.copyWith(
                          color: titleColor,
                          fontSize: 16,
                          fontWeight: fontWeight ?? FontWeight.w700),*/
                            textAlign: TextAlign.center,
                          ),
                        ],
                      )
                    : AutoSizeText(
                        title!,
                        /* style: TextStyles.dmSans.copyWith(
                      color: titleColor,
                      fontSize: 16,
                      fontWeight: fontWeight ?? FontWeight.w700),*/
                        textAlign: TextAlign.center,
                      ),
              )),
        ));
  }
}
