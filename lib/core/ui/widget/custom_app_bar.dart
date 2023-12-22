import '../../../../core/index.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Stack(
        children: [
          CircleAvatar(
            backgroundImage: AssetImage(Images.userImage),
            backgroundColor: Colors.transparent,
          ),
        ],
      ),
      title: const AutoSizeText(
        'Hello, Djihane',
      ),
      subtitle: Row(
        children: [
          SvgPicture.asset(
            Images.iconDone,
          ),
          const SizedBox(
            width: 05,
          ),
          const AutoSizeText('0912876543'),
        ],
      ),
      trailing: SvgPicture.asset(
        Images.notification,
      ),
    );
  }
}
