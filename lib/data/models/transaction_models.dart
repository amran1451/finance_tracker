import '../db/app_database.dart';

class TransactionWithDetails {
  TransactionWithDetails({
    required this.transaction,
    required this.account,
    this.category,
    this.planItem,
    this.criticality,
  });

  final TransactionsTableData transaction;
  final AccountsTableData account;
  final CategoriesTableData? category;
  final PlanItemsTableData? planItem;
  final CriticalityTableData? criticality;
}

class TransactionFilter {
  const TransactionFilter({
    this.from,
    this.to,
    this.accountId,
    this.categoryId,
    this.planOnly,
    this.type,
    this.criticalityId,
    this.excludeFromBudget,
  });

  final DateTime? from;
  final DateTime? to;
  final String? accountId;
  final String? categoryId;
  final bool? planOnly;
  final String? type;
  final String? criticalityId;
  final bool? excludeFromBudget;
}
