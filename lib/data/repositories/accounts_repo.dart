import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../core/utils/id.dart';
import '../db/drift_database.dart';
import '../models/account.dart';
import 'database_provider.dart';

final accountsRepositoryProvider = Provider<AccountsRepository>((ref) {
  final db = ref.watch(databaseProvider);
  return AccountsRepository(db);
});

class AccountsRepository {
  AccountsRepository(this.db);

  final AppDatabase db;

  Future<List<Account>> fetchAccounts() async {
    final rows = await db.select(db.accountsTable).get();
    return rows
        .map((row) => Account(
              id: row.id,
              name: row.name,
              type: AccountType.values
                  .firstWhere((e) => e.name == row.type, orElse: () => AccountType.cash),
              currency: row.currency,
              openingBalance: row.openingBalance,
              archived: row.archived,
            ))
        .toList();
  }

  Future<void> add(Account account) async {
    await db.into(db.accountsTable).insertOnConflictUpdate(
          AccountsTableCompanion.insert(
            id: account.id.isEmpty ? generateId() : account.id,
            name: account.name,
            type: account.type.name,
            currency: account.currency,
            openingBalance: Value(account.openingBalance),
            archived: Value(account.archived),
          ),
        );
  }
}
