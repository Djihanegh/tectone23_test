import 'package:tectone23_test/feature/wallet/ui/widget/user_info.dart';

import '../../../../core/index.dart';
import '../widget/receiver_widget.dart';

class NewTransactionScreen extends StatefulWidget {
  const NewTransactionScreen({super.key});

  @override
  State<NewTransactionScreen> createState() => _NewTransactionScreenState();
}

class _NewTransactionScreenState extends State<NewTransactionScreen> {
  // TextEditingControllers
  late TextEditingController _amountTextEditingController;
  late TextEditingController _noteTextEditingController;
  late TextEditingController _addressTextEditingController;

  // form key
  final _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    _amountTextEditingController = TextEditingController();
    _noteTextEditingController = TextEditingController();
    _addressTextEditingController = TextEditingController();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    screenSizeInit(context);
    return Scaffold(
      body: SizedBox(
        height: sh!,
        child: Padding(
          padding: EdgeInsets.only(
            top: sh! * 0.05,
          ),
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                IconButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  icon: const Icon(Icons.arrow_back),
                  color: darkTheme.indicatorColor,
                ),
                SizedBox(
                  height: sh! * 0.01,
                ),
                const ReceiverWidget(),
                InputField.amount(
                  controller: _amountTextEditingController,
                  label: 'Amount*',
                ),
                InputField.address(
                  controller: _addressTextEditingController,
                  label: 'Address*',
                ),
                InputField.multiline(
                  controller: _noteTextEditingController,
                  label: 'Note*',
                ),
                Expanded(
                  child: Align(
                    alignment: Alignment.bottomCenter,
                    child: Container(
                      height: sh! * 0.15,
                      padding: const EdgeInsets.all(15),
                      child: CustomButton(
                        title: 'Pay ${_amountTextEditingController.text}',
                        titleColor: darkTheme.colorScheme.primaryContainer,
                        color: darkTheme.colorScheme.primary,
                        onPressed: () => {
                          if (_formKey.currentState!.validate())
                            {
                              ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                  content: Text('Transaction succeed'),
                                ),
                              ),

                            },
                        },
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
