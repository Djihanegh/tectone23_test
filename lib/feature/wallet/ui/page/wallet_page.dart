
import '../../../../core/index.dart';
import '../../../transaction/ui/page/transaction_page.dart';
import '../widget/action_button.dart';
import '../widget/balance_card.dart';

class WalletPage extends StatefulWidget {
  const WalletPage({super.key});

  @override
  State<WalletPage> createState() => _WalletPageState();
}

class _WalletPageState extends State<WalletPage> {
  PageController sliderController =
      PageController(initialPage: 0, keepPage: false);

  int currentPage = 0;
  int j = 1;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    screenSizeInit(context);
    return Scaffold(
        body: SingleChildScrollView(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const CustomAppBar(),
          SizedBox(
            height: sh! * 0.26,
            width: sw,
            child: PageView.builder(
              onPageChanged: (value) {
                setState(() {
                  currentPage = value;
                });
              },
              controller: sliderController,
              itemCount: Constants.wallets.length,
              itemBuilder: (context, index) =>
                  BalanceCard(wallet: Constants.wallets[index]),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: List.generate(
              Constants.wallets.length,
              (index) => buildDot(index: index, currentPage: currentPage),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(top: sh! * 0.045, bottom: sh! * 0.045),
            child: const Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                children: [
                  ActionButton(
                    key: Key('Send'),
                  ),
                  SizedBox(
                    width: 20,
                  ),
                  ActionButton(
                    key: Key('Receive'),
                  ),
                ],
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(top: sh! * 0.02, left: sh! * 0.02),
            child: AutoSizeText(
              'Transactions',
              style: darkTheme.textTheme.titleLarge,
            ),
          ),
          const TransactionPage(),
        ],
      ),
    ));
  }
}
