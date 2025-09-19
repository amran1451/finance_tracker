import 'package:hooks_riverpod/hooks_riverpod.dart';

class TransactionFilters {
  const TransactionFilters({
    this.periodId,
    this.accountId,
    this.categoryId,
    this.query,
    this.planned,
  });

  final String? periodId;
  final String? accountId;
  final String? categoryId;
  final String? query;
  final bool? planned;

  TransactionFilters copyWith({
    String? periodId,
    String? accountId,
    String? categoryId,
    String? query,
    bool? planned,
  }) {
    return TransactionFilters(
      periodId: periodId ?? this.periodId,
      accountId: accountId ?? this.accountId,
      categoryId: categoryId ?? this.categoryId,
      query: query ?? this.query,
      planned: planned ?? this.planned,
    );
  }
}

class FiltersNotifier extends StateNotifier<TransactionFilters> {
  FiltersNotifier() : super(const TransactionFilters());

  void setPeriod(String? periodId) => state = state.copyWith(periodId: periodId);
  void setAccount(String? accountId) => state = state.copyWith(accountId: accountId);
  void setCategory(String? categoryId) => state = state.copyWith(categoryId: categoryId);
  void setQuery(String? query) => state = state.copyWith(query: query);
  void setPlanned(bool? planned) => state = state.copyWith(planned: planned);
  void clear() => state = const TransactionFilters();
}

final filtersNotifierProvider =
    StateNotifierProvider<FiltersNotifier, TransactionFilters>((ref) => FiltersNotifier());
