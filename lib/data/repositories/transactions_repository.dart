import 'dart:io';

import 'package:drift/drift.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:path/path.dart' as p;
import 'package:path_provider/path_provider.dart';
import 'package:uuid/uuid.dart';

import '../db/app_database.dart';
import '../models/transaction_models.dart';
import 'database_provider.dart';

class TransactionsRepository {
  TransactionsRepository(this._db);

  final AppDatabase _db;

  Stream<List<TransactionWithDetails>> watchTransactions(
    TransactionFilter filter,
  ) {
    final tx = _db.transactionsTable;
    final query = _db.select(tx);

    if (filter.from != null) {
      query.where(tx.datetime.isBiggerOrEqualValue(filter.from!));
    }
    if (filter.to != null) {
      query.where(tx.datetime.isSmallerOrEqualValue(filter.to!));
    }
    if (filter.accountId != null) {
      query.where(tx.accountId.equals(filter.accountId!));
    }
    if (filter.categoryId != null) {
      query.where(tx.categoryId.equals(filter.categoryId!));
    }
    if (filter.planOnly != null) {
      if (filter.planOnly!) {
        query.where(tx.planItemId.isNotNull());
      } else {
        query.where(tx.planItemId.isNull());
      }
    }
    if (filter.type != null) {
      query.where(tx.type.equals(filter.type!));
    }
    if (filter.criticalityId != null) {
      query.where(tx.criticalityId.equals(filter.criticalityId!));
    }
    if (filter.excludeFromBudget != null) {
      query.where(
        tx.excludeFromBudget.equals(filter.excludeFromBudget!),
      );
    }

    query.orderBy([(tbl) => OrderingTerm(expression: tbl.datetime, mode: OrderingMode.desc)]);

    final joined = query.join([
      innerJoin(_db.accountsTable, _db.accountsTable.id.equalsExp(tx.accountId)),
      leftOuterJoin(_db.categoriesTable, _db.categoriesTable.id.equalsExp(tx.categoryId)),
      leftOuterJoin(_db.planItemsTable, _db.planItemsTable.id.equalsExp(tx.planItemId)),
      leftOuterJoin(_db.criticalityTable, _db.criticalityTable.id.equalsExp(tx.criticalityId)),
    ]);

    return joined.watch().map((rows) {
      return rows.map((row) {
        final transaction = row.readTable(tx);
        final account = row.readTable(_db.accountsTable);
        final category = row.readTableOrNull(_db.categoriesTable);
        final plan = row.readTableOrNull(_db.planItemsTable);
        final criticality = row.readTableOrNull(_db.criticalityTable);
        return TransactionWithDetails(
          transaction: transaction,
          account: account,
          category: category,
          planItem: plan,
          criticality: criticality,
        );
      }).toList();
    });
  }

  Future<void> createExpense({
    required String id,
    required DateTime datetime,
    required int amount,
    required String accountId,
    String? categoryId,
    String? planItemId,
    String? criticalityId,
    String? note,
    List<String> attachments = const [],
    bool excludeFromBudget = false,
  }) {
    return _db.into(_db.transactionsTable).insert(
          TransactionsTableCompanion.insert(
            id: id,
            datetime: datetime,
            amount: amount,
            currency: 'RUB',
            accountId: accountId,
            type: 'expense',
            categoryId: Value(categoryId),
            planItemId: Value(planItemId),
            criticalityId: Value(criticalityId),
            note: Value(note),
            attachments: Value(attachments),
            excludeFromBudget: Value(excludeFromBudget),
          ),
        );
  }

  Future<void> createIncome({
    required String id,
    required DateTime datetime,
    required int amount,
    required String accountId,
    String? categoryId,
    String? criticalityId,
    String? note,
    List<String> attachments = const [],
  }) {
    return _db.into(_db.transactionsTable).insert(
          TransactionsTableCompanion.insert(
            id: id,
            datetime: datetime,
            amount: amount,
            currency: 'RUB',
            accountId: accountId,
            type: 'income',
            categoryId: Value(categoryId),
            criticalityId: Value(criticalityId),
            note: Value(note),
            attachments: Value(attachments),
          ),
        );
  }

  Future<void> createTransfer({
    required DateTime datetime,
    required int amount,
    required String fromAccountId,
    required String toAccountId,
    String? note,
  }) async {
    final transferId = const Uuid().v4();
    final marker = 'transfer:$transferId';
    await _db.batch((batch) {
      batch.insert(
        _db.transactionsTable,
        TransactionsTableCompanion.insert(
          id: 'tx-$transferId-from',
          datetime: datetime,
          amount: amount,
          currency: 'RUB',
          accountId: fromAccountId,
          type: 'transfer',
          note: Value(note ?? marker),
          attachments: const Value(<String>[]),
        ),
      );
      batch.insert(
        _db.transactionsTable,
        TransactionsTableCompanion.insert(
          id: 'tx-$transferId-to',
          datetime: datetime.add(const Duration(minutes: 1)),
          amount: amount,
          currency: 'RUB',
          accountId: toAccountId,
          type: 'transfer',
          note: Value(note ?? marker),
          attachments: const Value(<String>[]),
        ),
      );
    });
  }

  Future<void> updateTransaction(TransactionsTableData data) {
    return _db.update(_db.transactionsTable).replace(data);
  }

  Future<void> deleteTransaction(String id) {
    return (_db.delete(_db.transactionsTable)
          ..where((tbl) => tbl.id.equals(id)))
        .go();
  }

  Future<String> exportCsvForPeriod(PaycheckPeriodsTableData period) async {
    final tx = _db.transactionsTable;
    final query = _db.select(tx)
      ..where(tx.datetime.isBetweenValues(period.startDate, period.endDate))
      ..where(tx.excludeFromBudget.equals(false));
    query.orderBy([(tbl) => OrderingTerm(expression: tbl.datetime)]);

    final joined = query.join([
      innerJoin(_db.accountsTable, _db.accountsTable.id.equalsExp(tx.accountId)),
      leftOuterJoin(_db.categoriesTable, _db.categoriesTable.id.equalsExp(tx.categoryId)),
      leftOuterJoin(_db.planItemsTable, _db.planItemsTable.id.equalsExp(tx.planItemId)),
      leftOuterJoin(_db.criticalityTable, _db.criticalityTable.id.equalsExp(tx.criticalityId)),
    ]);
    final rows = await joined.get();
    final buffer = StringBuffer('id,datetime,amount,account,type,category,plan,criticality,note\n');
    for (final row in rows) {
      final transaction = row.readTable(tx);
      final account = row.readTable(_db.accountsTable);
      final category = row.readTableOrNull(_db.categoriesTable);
      final plan = row.readTableOrNull(_db.planItemsTable);
      final crit = row.readTableOrNull(_db.criticalityTable);
      final values = [
        transaction.id,
        transaction.datetime.toIso8601String(),
        transaction.amount.toString(),
        account.name,
        transaction.type,
        category?.name ?? '',
        plan?.title ?? '',
        crit?.name ?? '',
        transaction.note ?? '',
      ];
      buffer.writeln(values.map(_escapeCsv).join(','));
    }
    final directory = await getApplicationDocumentsDirectory();
    final file = File(p.join(directory.path, 'transactions_${period.id}.csv'));
    await file.writeAsString(buffer.toString());
    return file.path;
  }

  String _escapeCsv(String input) {
    if (input.contains(',') || input.contains('\n') || input.contains('"')) {
      final escaped = input.replaceAll('"', '""');
      return '"$escaped"';
    }
    return input;
  }

  Future<int> sumForPeriod({
    required PaycheckPeriodsTableData period,
    required String type,
    bool planOnly = false,
    bool? excludeFromBudget,
  }) async {
    final tx = _db.transactionsTable;
    final sumExpr = tx.amount.sum();
    final query = _db.selectOnly(tx)
      ..addColumns([sumExpr])
      ..where(tx.datetime.isBetweenValues(period.startDate, period.endDate))
      ..where(tx.type.equals(type));
    if (excludeFromBudget != null) {
      query.where(tx.excludeFromBudget.equals(excludeFromBudget));
    }
    if (planOnly) {
      query.where(tx.planItemId.isNotNull());
    }
    final result = await query.getSingleOrNull();
    final sum = result?.read(sumExpr) ?? 0;
    return sum;
  }

  Future<int> sumUnplannedExpenses(PaycheckPeriodsTableData period) async {
    final tx = _db.transactionsTable;
    final sumExpr = tx.amount.sum();
    final query = _db.selectOnly(tx)
      ..addColumns([sumExpr])
      ..where(tx.datetime.isBetweenValues(period.startDate, period.endDate))
      ..where(tx.type.equals('expense'))
      ..where(tx.planItemId.isNull());
    final result = await query.getSingleOrNull();
    return result?.read(sumExpr) ?? 0;
  }

  Future<Map<String, int>> amountsByCriticality(
      PaycheckPeriodsTableData period) async {
    final tx = _db.transactionsTable;
    final critColumn = tx.criticalityId;
    final sumExpr = tx.amount.sum();
    final query = _db.selectOnly(tx)
      ..addColumns([critColumn, sumExpr])
      ..where(tx.datetime.isBetweenValues(period.startDate, period.endDate))
      ..where(tx.type.equals('expense'))
      ..where(tx.excludeFromBudget.equals(false))
      ..groupBy([tx.criticalityId]);
    final rows = await query.get();
    final result = <String, int>{};
    for (final row in rows) {
      final id = row.read(critColumn);
      if (id != null) {
        result[id] = row.read(sumExpr) ?? 0;
      }
    }
    return result;
  }

  Future<List<String>> lastCriticalityIds(int limit) async {
    final tx = _db.transactionsTable;
    final query = _db.select(tx)
      ..where(tx.criticalityId.isNotNull())
      ..orderBy([(tbl) => OrderingTerm(expression: tbl.datetime, mode: OrderingMode.desc)])
      ..limit(limit * 2);
    final rows = await query.get();
    final ids = <String>[];
    for (final row in rows) {
      final id = row.criticalityId;
      if (id != null && !ids.contains(id)) {
        ids.add(id);
      }
      if (ids.length >= limit) {
        break;
      }
    }
    return ids;
  }
}

final transactionsRepositoryProvider = Provider<TransactionsRepository>((ref) {
  final db = ref.watch(databaseProvider);
  return TransactionsRepository(db);
});
