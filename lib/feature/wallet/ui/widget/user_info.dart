import '../../../../core/index.dart';

class UserInfoWidget extends StatelessWidget {
  const UserInfoWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: sw!,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color:  darkTheme.primaryColor)),
      padding: const EdgeInsets.only(top: 20, bottom: 20, left: 20),
      child: Row(
        children: [
          Image.asset(
            Images.userImage,
            height: 40,
            width: 40,
          ),
          const SizedBox(
            width: 20,
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const AutoSizeText(
                'Djihane Gh',
              ),
              const SizedBox(
                height: 5,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const AutoSizeText(
                    '0912876543',
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  AutoSizeText('Copy',
                      style: darkTheme.textTheme.labelSmall!
                          .copyWith(color: darkTheme.colorScheme.primary)),
                  const SizedBox(
                    width: 3,
                  ),
                  SvgPicture.asset(Images.copy)
                ],
              ),
              const SizedBox(
                height: 5,
              ),
              const AutoSizeText(
                'Banking Name : Paysera',
              ),
            ],
          )
        ],
      ),
    );
  }
}
