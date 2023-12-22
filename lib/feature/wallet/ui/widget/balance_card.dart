import 'package:tectone23_test/feature/wallet/model/wallet.dart';

import '../../../../../core/index.dart';

class BalanceCard extends StatefulWidget {
  const BalanceCard({
    required this.wallet,
    super.key,
  });

  final Wallet wallet;

  @override
  State<BalanceCard> createState() => _BalanceCardState();
}

class _BalanceCardState extends State<BalanceCard> {
  bool isVisible = false;

  @override
  Widget build(BuildContext context) {
    final wallet = widget.wallet;
    screenSizeInit(context);
    return SingleChildScrollView(
        child: Padding(
            padding: const EdgeInsets.only(
              left: 20,
              right: 20,
            ),
            child: Column(
              children: [
                Padding(
                    padding: EdgeInsets.only(
                      top: sh! * 0.045,
                      bottom: sh! * 0.045,
                    ),
                    child: Center(
                      child: Container(
                        padding: const EdgeInsets.only(
                          left: 25,
                          right: 25,
                          top: 10,
                          bottom: 10,
                        ),
                        decoration: BoxDecoration(
                          color: darkTheme.primaryColor,
                          borderRadius: BorderRadius.circular(57),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Image.asset(
                              Images.paysera,
                              height: 20,
                              width: 20,
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                            AutoSizeText(
                              wallet.id,
                            ),
                          ],
                        ),
                      ),
                    )),
                Container(
                    padding: const EdgeInsets.only(
                      left: 25,
                      right: 25,
                      top: 25,
                      bottom: 25,
                    ),
                    decoration: BoxDecoration(
                      color: darkTheme.primaryColor,
                      borderRadius: const BorderRadius.all(Radius.circular(10)),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Center(
                          child: AutoSizeText(
                            'Current Balance'.toUpperCase(),
                            style: darkTheme.textTheme.titleMedium,
                          ),
                        ),
                        Padding(
                            padding: EdgeInsets.only(
                              top: sh! * 0.015,
                              bottom: sh! * 0.045,
                            ),
                            child: Center(
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  const Icon(
                                    Icons.euro_symbol,
                                    color: Colors.white,
                                  ),
                                  const SizedBox(
                                    width: 10,
                                  ),
                                  AutoSizeText(
                                      isVisible ? '${wallet.balance}' : 'xxxx',
                                      style: darkTheme.textTheme.titleSmall),
                                  const SizedBox(
                                    width: 10,
                                  ),
                                  GestureDetector(
                                      onTap: () {
                                        setState(() {
                                          isVisible = !isVisible;
                                        });
                                      },
                                      child: SvgPicture.asset(
                                        isVisible
                                            ? Images.trash
                                            : Images.visible,
                                      )),
                                ],
                              ),
                            )),
                      ],
                    ))
              ],
            )));
  }
}
