import 'package:tectone23_test/feature/profile/model/user.dart';
import 'package:tectone23_test/feature/transaction/model/transaction.dart';
import 'package:tectone23_test/feature/wallet/model/wallet.dart';

abstract class Constants {
  const Constants._();

  // animation duration
  static const kAnimationDuration = Duration(milliseconds: 1000);

  static List<Wallet> wallets = [
    Wallet(
      id: '3FZbgi29cpjq2GjdwV8eyHuJJnkLtktZc5',
      address: 'New York',
      createdAt: DateTime(2017, 9, 7, 17, 30),
      transactions: transactions,
      status: WalletStatus.active,
      balance: 10000,
    ),
    Wallet(
      id: 'AnKBZbgi29cpjq2GjdwV8eyHuJJnkLtktZc5',
      address: 'New York',
      createdAt: DateTime(2017, 9, 7, 17, 30),
      transactions: transactions,
      status: WalletStatus.active,
      balance: 200,
    ),
    Wallet(
      id: 'Bcpjq2GjdDSJHDSdneyHuJJnkLtktZc5',
      address: 'New York',
      createdAt: DateTime(2017, 9, 7, 17, 30),
      transactions: transactions,
      status: WalletStatus.active,
      balance: 400000,
    ),
    Wallet(
      id: 'PlKmbgi29cpjq2GjdwV8eyHuJJnkLtktZc5',
      address: 'New York',
      createdAt: DateTime(2017, 9, 7, 17, 30),
      transactions: transactions,
      status: WalletStatus.active,
      balance: 30,
    ),
  ];

  static List<Transaction> transactions = [
    Transaction(
        id: 1,
        walletId: 1,
        date: DateTime(2018, 9, 7, 17, 30),
        source: const User(id: 1, name: 'Djihane ghilani', address: 'Annaba'),
        recipient: const User(id: 10, name: 'Amine', address: 'Alger'),
        status: TransactionStatus.success,
        value: 100,
        description: 'For service'),
    Transaction(
        id: 2,
        walletId: 1,
        date: DateTime(2018, 9, 7, 17, 30),
        source: const User(id: 10, name: 'Amine', address: 'Alger'),
        recipient:
            const User(id: 1, name: 'Djihane ghilani', address: 'Annaba'),
        status: TransactionStatus.success,
        value: 300,
        description: 'For service 2'),
    Transaction(
        id: 3,
        walletId: 1,
        date: DateTime(2018, 9, 7, 17, 30),
        source: const User(id: 1, name: 'Djihane ghilani', address: 'Annaba'),
        recipient: const User(id: 10, name: 'Amine', address: 'Alger'),
        status: TransactionStatus.success,
        value: 900,
        description: 'For service 3')
  ];
}
