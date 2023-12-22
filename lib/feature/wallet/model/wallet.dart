import 'package:equatable/equatable.dart';
import 'package:tectone23_test/feature/transaction/model/transaction.dart';

class Wallet extends Equatable {
  const Wallet(
      {required this.id,
      required this.address,
      required this.createdAt,
      required this.transactions,
      required this.status,
      required this.balance});

  final String id;
  final String address;
  final DateTime createdAt;
  final List<Transaction> transactions;
  final WalletStatus status;
  final double balance;

  @override
  List<Object?> get props =>
      [id, address, transactions, createdAt, status, balance];
}

enum WalletStatus { active, deleted }



