import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../data/models/budget.dart';
import '../../../data/repositories/budgets_repo.dart';

final budgetProvider = FutureProvider.family<List<Budget>, String>((ref, periodId) async {
  final repo = ref.watch(budgetsRepositoryProvider);
  return repo.fetchBudgets(periodId);
});
