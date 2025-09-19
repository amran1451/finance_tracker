import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../core/utils/id.dart';
import '../../../data/models/transaction.dart';
import '../../../data/repositories/transactions_repo.dart';

class QuickAddState {
  const QuickAddState({
    this.amount = '0',
    this.note = '',
    this.planned = false,
    this.type = TransactionType.expense,
  });

  final String amount;
  final String note;
  final bool planned;
  final TransactionType type;

  QuickAddState copyWith({
    String? amount,
    String? note,
    bool? planned,
    TransactionType? type,
  }) {
    return QuickAddState(
      amount: amount ?? this.amount,
      note: note ?? this.note,
      planned: planned ?? this.planned,
      type: type ?? this.type,
    );
  }
}

class QuickAddNotifier extends StateNotifier<QuickAddState> {
  QuickAddNotifier(this._transactionsRepository) : super(const QuickAddState());

  final TransactionsRepositoryBase _transactionsRepository;

  void appendAmount(String value) {
    if (value == '⌫') {
      if (state.amount.isNotEmpty) {
        final next = state.amount.substring(0, state.amount.length - 1);
        state = state.copyWith(amount: next.isEmpty ? '0' : next);
      }
      return;
    }
    if (state.amount == '0') {
      state = state.copyWith(amount: value);
    } else {
      state = state.copyWith(amount: '${state.amount}$value');
    }
  }

  void togglePlanned(bool value) => state = state.copyWith(planned: value);
  void setType(TransactionType type) => state = state.copyWith(type: type);
  void setNote(String value) => state = state.copyWith(note: value);

  Future<void> submit() async {
    final amount = double.tryParse(state.amount.replaceAll(',', '.')) ?? 0;
    final tx = FinanceTransaction(
      id: generateId(),
      datetime: DateTime.now(),
      amount: state.type == TransactionType.expense ? -amount : amount,
      currency: 'RUB',
      accountId: 'card',
      type: state.type,
      planned: state.planned,
    );
    await _transactionsRepository.add(tx);
    state = const QuickAddState();
  }
}

final quickAddNotifierProvider =
    StateNotifierProvider<QuickAddNotifier, QuickAddState>((ref) {
  final repo = ref.watch(transactionsRepositoryProvider);
  return QuickAddNotifier(repo);
});
