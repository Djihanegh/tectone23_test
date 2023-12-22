import '../../../../core/index.dart';
import 'receive_money_dialog.dart';

class ActionButton extends StatelessWidget {
  const ActionButton({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: () {
          key == const Key('Send')
              ? context.pushNamed(AppRoute.newTransaction.name)
              : showReceiveMoneyPopUp(context: context);
        },
        child: Container(
          padding:
              const EdgeInsets.only(left: 8, right: 25, top: 10, bottom: 10),
          decoration: BoxDecoration(
              color: darkTheme.colorScheme.secondaryContainer,
              borderRadius: BorderRadius.circular(57)),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                padding: const EdgeInsets.all(15),
                decoration: BoxDecoration(
                  color: darkTheme.colorScheme.primary,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: SvgPicture.asset(
                  key == const Key('Send')
                      ? Images.sendIcon
                      : Images.requestIcon,
                ),
              ),
              const SizedBox(
                width: 15,
              ),
              AutoSizeText(
                key == const Key('Send')
                    ? context.l10n.send
                    : context.l10n.receive,
              ),
            ],
          ),
        ));
  }
}
