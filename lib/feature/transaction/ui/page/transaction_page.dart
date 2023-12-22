import 'package:tectone23_test/core/ui/widget/horizontal_line.dart';

import '../../../../core/index.dart';
import '../widget/transaction_bar.dart';
import '../widget/transaction_widget.dart';

class TransactionPage extends StatefulWidget {
  const TransactionPage({super.key});

  @override
  State<TransactionPage> createState() => _TransactionPageState();
}

class _TransactionPageState extends State<TransactionPage> {
  @override
  Widget build(BuildContext context) {
    screenSizeInit(context);
    return SingleChildScrollView(
      physics: const NeverScrollableScrollPhysics(),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const TransactionBar(
            title: 'Today',
          ),
          Padding(
            padding: const EdgeInsets.only(left: 20, right: 20, top: 20),
            child: ListView.separated(
              physics: const NeverScrollableScrollPhysics(),
              scrollDirection: Axis.vertical,
              shrinkWrap: true,
              itemCount: 5,
              itemBuilder: (context, index) => const TransactionWidget(),
              separatorBuilder: (context, index) {
                return const HorizontalLine();
              },
            ),
          ),
          const TransactionBar(
            title: 'Yesterday',
          ),
          Padding(
            padding: const EdgeInsets.only(left: 20, right: 20, top: 20),
            child: ListView.separated(
              physics: const NeverScrollableScrollPhysics(),
              scrollDirection: Axis.vertical,
              shrinkWrap: true,
              itemCount: 5,
              itemBuilder: (context, index) => const TransactionWidget(),
              separatorBuilder: (context, index) {
                return const HorizontalLine();
              },
            ),
          ),
        ],
      ),
    );
  }
}
