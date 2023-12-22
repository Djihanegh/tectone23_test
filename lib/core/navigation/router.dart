import 'package:tectone23_test/feature/transaction/ui/page/new_transaction_page.dart';

import '../../feature/auth/ui/page/auth_page.dart';
import '../index.dart';

GoRouter getRouter() {
  return GoRouter(
    routes: [
      GoRoute(
        path: AppRoute.splash.path,
        name: AppRoute.splash.name,
        builder: (context, state) => const SplashPage(),
      ),
      GoRoute(
        path: AppRoute.home.path,
        name: AppRoute.home.name,
        builder: (context, state) => const HomePage(),
      ),
      GoRoute(
        path: AppRoute.profile.path,
        name: AppRoute.profile.name,
        builder: (context, state) => const ProfilePage(),
      ),
      GoRoute(
        path: AppRoute.wallet.path,
        name: AppRoute.wallet.name,
        builder: (context, state) => const WalletPage(),
      ),
      GoRoute(
        path: AppRoute.newTransaction.path,
        name: AppRoute.newTransaction.name,
        builder: (context, state) => const NewTransactionScreen(),
      ),
      GoRoute(
        path: AppRoute.auth.path,
        name: AppRoute.auth.name,
        builder: (context, state) => const AuthPage(),
      ),
    ],
  );
}
