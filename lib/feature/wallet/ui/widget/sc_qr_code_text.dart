import 'package:tectone23_test/core/index.dart';

class ScanQrCodeText extends StatelessWidget {
  const ScanQrCodeText({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.only(left: 20, right: 20),
        child: Center(
            child: RichText(
          textAlign: TextAlign.center,
          text: TextSpan(
            children: <TextSpan>[
              TextSpan(
                  text:
                      'Scan the QR code to access more information. If you have any issues, contact',
                  style: darkTheme.textTheme.labelMedium!),
              TextSpan(
                  text: 'Tectone Customer Support',
                  style: darkTheme.textTheme.labelMedium!
                      .copyWith(color: darkTheme.colorScheme.primary)),
              TextSpan(
                  text: ' for assistance.',
                  style: darkTheme.textTheme.labelMedium!),
            ],
          ),
        )));
  }
}
