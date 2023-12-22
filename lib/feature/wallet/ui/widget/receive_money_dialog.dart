import '../../../../core/index.dart';
import 'sc_qr_code_text.dart';
import 'user_info.dart';

showReceiveMoneyPopUp({
  BuildContext? context,
}) {
  showDialog(
    barrierDismissible: true,
    context: context!,
    builder: (context) {
      return Dialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        child: Container(
          height: sh! * 0.6,
          width: sw!,
          decoration: BoxDecoration(
            //  color: Colors.white,
            borderRadius: BorderRadius.circular(20),
          ),
          child: const _Body(),
        ),
      );
    },
  );
}

class _Body extends StatefulWidget {
  const _Body({super.key});

  @override
  State<_Body> createState() => _BodyState();
}

class _BodyState extends State<_Body> {
  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const CustomHeader(title: 'Receive money'),
            SizedBox(
              height: sh! * 0.02,
            ),
            const HorizontalLine(),
            SizedBox(
              height: sh! * 0.02,
            ),
            const UserInfoWidget(),
            SizedBox(
              height: sh! * 0.03,
            ),
            Center(
              child: Image.asset(
                Images.qrcode,
                height: 100,
                width: 100,
              ),
            ),
            SizedBox(
              height: sh! * 0.03,
            ),
            const ScanQrCodeText(),
          ],
        ));
  }
}
