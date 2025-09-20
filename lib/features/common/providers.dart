import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../data/db/app_database.dart';
import '../../data/repositories/accounts_repository.dart';
import '../../data/repositories/categories_repository.dart';
import '../../data/repositories/criticality_repository.dart';
import '../../data/repositories/database_provider.dart';
import '../../data/repositories/transactions_repository.dart';

final expenseCategoriesProvider =
    StreamProvider<List<CategoriesTableData>>((ref) {
  final repo = ref.watch(categoriesRepositoryProvider);
  return repo.watchByKind('expense');
});

final incomeCategoriesProvider =
    StreamProvider<List<CategoriesTableData>>((ref) {
  final repo = ref.watch(categoriesRepositoryProvider);
  return repo.watchByKind('income');
});

final accountsProvider = StreamProvider<List<AccountsTableData>>((ref) {
  final repo = ref.watch(accountsRepositoryProvider);
  return repo.watchAccounts();
});

final criticalityProvider =
    StreamProvider<List<CriticalityTableData>>((ref) {
  final repo = ref.watch(criticalityRepositoryProvider);
  return repo.watchActive();
});

final allCriticalityProvider =
    StreamProvider<List<CriticalityTableData>>((ref) {
  final repo = ref.watch(criticalityRepositoryProvider);
  return repo.watchAll();
});

final allCategoriesProvider =
    FutureProvider<List<CategoriesTableData>>((ref) async {
  final repo = ref.watch(categoriesRepositoryProvider);
  return repo.fetchAll();
});

final recentCriticalityProvider =
    FutureProvider<List<CriticalityTableData>>((ref) async {
  final txRepo = ref.watch(transactionsRepositoryProvider);
  final ids = await txRepo.lastCriticalityIds(3);
  if (ids.isEmpty) {
    return const [];
  }
  final db = ref.watch(databaseProvider);
  final query = db.select(db.criticalityTable)
    ..where((tbl) => tbl.id.isIn(ids));
  final items = await query.get();
  items.sort((a, b) => ids.indexOf(a.id).compareTo(ids.indexOf(b.id)));
  return items;
});
