import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../core/utils/currency_format.dart';
import '../../../data/models/plan_item.dart';
import '../../../data/repositories/accounts_repo.dart';
import '../../../data/repositories/plans_repo.dart';
import '../../../data/repositories/transactions_repo.dart';

final homeDashboardProvider = FutureProvider<HomeDashboardData>((ref) async {
  final accountsRepo = ref.watch(accountsRepositoryProvider);
  final transactionsRepo = ref.watch(transactionsRepositoryProvider);
  final plansRepo = ref.watch(plansRepositoryProvider);
  final accounts = await accountsRepo.fetchAccounts();
  final transactions = await transactionsRepo.fetchTransactions();
  final plans = await plansRepo.fetchPlans();
  final totalBalance = accounts.fold<double>(0, (sum, account) => sum + account.openingBalance);
  final plannedSpending = transactions
      .where((tx) => tx.planned)
      .fold<double>(0, (sum, tx) => sum + tx.amount.abs());
  final unplannedSpending = transactions
      .where((tx) => !tx.planned)
      .fold<double>(0, (sum, tx) => sum + tx.amount.abs());
  final safeToSpend = totalBalance - plannedSpending - unplannedSpending;
  return HomeDashboardData(
    totalBalance: totalBalance,
    plannedSpending: plannedSpending,
    unplannedSpending: unplannedSpending,
    safeToSpend: safeToSpend,
    plans: plans,
  );
});

class HomeDashboardData {
  HomeDashboardData({
    required this.totalBalance,
    required this.plannedSpending,
    required this.unplannedSpending,
    required this.safeToSpend,
    required this.plans,
  });

  final double totalBalance;
  final double plannedSpending;
  final double unplannedSpending;
  final double safeToSpend;
  final List<PlanItem> plans;

  String get safeToSpendLabel => formatCurrency(safeToSpend);
}
