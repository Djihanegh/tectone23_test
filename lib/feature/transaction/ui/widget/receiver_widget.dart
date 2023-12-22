import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:tectone23_test/core/app/index.dart';

class ReceiverWidget extends StatelessWidget {
  const ReceiverWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: AutoSizeText(
        'Paying to',
        style: darkTheme.textTheme.labelMedium,
      ),
      subtitle: AutoSizeText(
        "Mohamed Amine ",
        style: darkTheme.textTheme.labelMedium,
      ),
      leading: CircleAvatar(
        radius: 25,
        backgroundColor: const Color(0xFFD8D3F8),
        child: AutoSizeText(
          "MA",
          style: darkTheme.textTheme.labelLarge,
        ),
      ),
    );
  }
}
