import 'dart:convert';

import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../core/error/failures.dart';
import '../db/drift_database.dart';
import '../models/transaction.dart';
import 'database_provider.dart';

abstract class TransactionsRepositoryBase {
  Future<List<FinanceTransaction>> fetchTransactions();
  Future<void> add(FinanceTransaction transaction);
}

final transactionsRepositoryProvider = Provider<TransactionsRepositoryBase>((ref) {
  final db = ref.watch(databaseProvider);
  return TransactionsRepository(db);
});

class TransactionsRepository implements TransactionsRepositoryBase {
  TransactionsRepository(this.db);

  final AppDatabase db;

  @override
  Future<List<FinanceTransaction>> fetchTransactions() async {
    final rows = await db.select(db.transactionsTable).get();
    return rows.map(_mapRow).toList();
  }

  FinanceTransaction _mapRow(TransactionsTableData row) {
    final tagList = (jsonDecode(row.tags) as List).cast<String>();
    final attachments = (jsonDecode(row.attachments) as List)
        .map((e) => Attachment.fromJson(Map<String, dynamic>.from(e as Map)))
        .toList();
    return FinanceTransaction(
      id: row.id,
      datetime: row.datetime,
      amount: row.amount,
      currency: row.currency,
      accountId: row.accountId,
      type: TransactionType.values
          .firstWhere((e) => e.name == row.type, orElse: () => TransactionType.expense),
      categoryId: row.categoryId,
      tags: tagList,
      merchantId: row.merchantId,
      note: row.note,
      attachments: attachments,
      planned: row.planned,
      planItemId: row.planItemId,
      excludeFromBudget: row.excludeFromBudget,
    );
  }

  @override
  Future<void> add(FinanceTransaction transaction) async {
    try {
      await db.into(db.transactionsTable).insertOnConflictUpdate(
            TransactionsTableCompanion.insert(
              id: transaction.id,
              datetime: Value(transaction.datetime),
              amount: transaction.amount,
              currency: transaction.currency,
              accountId: transaction.accountId,
              type: transaction.type.name,
              categoryId: Value(transaction.categoryId),
              tags: Value(jsonEncode(transaction.tags)),
              merchantId: Value(transaction.merchantId),
              note: Value(transaction.note),
              attachments:
                  Value(jsonEncode(transaction.attachments.map((e) => e.toJson()).toList())),
              planned: Value(transaction.planned),
              planItemId: Value(transaction.planItemId),
              excludeFromBudget: Value(transaction.excludeFromBudget),
            ),
          );
    } catch (e) {
      throw DatabaseFailure('Failed to insert transaction: $e');
    }
  }
}
