import 'package:drift/drift.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../db/app_database.dart';
import 'database_provider.dart';

class AccountsRepository {
  AccountsRepository(this._db);

  final AppDatabase _db;

  Stream<List<AccountsTableData>> watchAccounts() {
    final query = _db.select(_db.accountsTable)
      ..where((tbl) => tbl.archived.equals(false));
    query.orderBy([(tbl) => OrderingTerm(expression: tbl.name)]);
    return query.watch();
  }

  Future<List<AccountsTableData>> fetchAll() {
    final query = _db.select(_db.accountsTable);
    return query.get();
  }

  Future<void> createAccount({
    required String id,
    required String name,
    required String type,
    String currency = 'RUB',
    int openingBalance = 0,
  }) {
    return _db.into(_db.accountsTable).insert(
          AccountsTableCompanion.insert(
            id: id,
            name: name,
            type: type,
            currency: Value(currency),
            openingBalance: Value(openingBalance),
          ),
          mode: InsertMode.insertOrReplace,
        );
  }

  Future<void> updateAccount(AccountsTableData account) {
    return _db.update(_db.accountsTable).replace(account);
  }

  Future<void> archiveAccount(String id) {
    return (_db.update(_db.accountsTable)
          ..where((tbl) => tbl.id.equals(id)))
        .write(const AccountsTableCompanion(archived: Value(true)));
  }
}

final accountsRepositoryProvider = Provider<AccountsRepository>((ref) {
  final db = ref.watch(databaseProvider);
  return AccountsRepository(db);
});
