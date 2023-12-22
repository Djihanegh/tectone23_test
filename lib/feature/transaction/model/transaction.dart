import 'package:equatable/equatable.dart';

import '../../profile/model/user.dart';

class Transaction extends Equatable {
  const Transaction(
      {required this.id,
      required this.walletId,
      required this.date,
      required this.source,
      required this.recipient,
      required this.status,
      required this.value,
      required this.description});

  final int id;
  final int walletId;
  final User recipient;
  final DateTime date;
  final User source;
  final TransactionStatus status;
  final double value;
  final String description;

  @override
  List<Object?> get props =>
      [id, walletId, date, source, recipient, status, value, description];
}

enum TransactionStatus { failed, success, loading, initial, unknown }
