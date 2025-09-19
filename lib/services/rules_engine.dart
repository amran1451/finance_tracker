import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../data/models/rule.dart';
import '../data/models/transaction.dart';
import '../data/repositories/rules_repo.dart';

final rulesEngineProvider = Provider<RulesEngine>((ref) {
  final repo = ref.watch(rulesRepositoryProvider);
  return RulesEngine(() => repo.fetchRules());
});

class RulesEngine {
  RulesEngine(this._rulesLoader);

  final Future<List<Rule>> Function() _rulesLoader;

  Future<FinanceTransaction> applyRules(FinanceTransaction transaction) async {
    final rules = await _rulesLoader();
    for (final rule in rules..sort((a, b) => b.priority.compareTo(a.priority))) {
      if (_matches(transaction, rule.condition)) {
        return _apply(transaction, rule.action);
      }
    }
    return transaction;
  }

  bool _matches(FinanceTransaction transaction, RuleCondition condition) {
    switch (condition.type) {
      case RuleConditionType.merchant:
        final merchant = transaction.merchantId ?? '';
        final expected = condition.data?['id'] as String?;
        return expected != null && merchant == expected;
      case RuleConditionType.amountRange:
        final min = (condition.data?['min'] as num?)?.toDouble() ?? double.negativeInfinity;
        final max = (condition.data?['max'] as num?)?.toDouble() ?? double.infinity;
        return transaction.amount >= min && transaction.amount <= max;
      case RuleConditionType.textMatch:
        final query = (condition.data?['query'] as String?)?.toLowerCase();
        return query != null && (transaction.note ?? '').toLowerCase().contains(query);
      case RuleConditionType.timeOfDay:
        final start = condition.data?['start'] as int? ?? 0;
        final end = condition.data?['end'] as int? ?? 24;
        final hour = transaction.datetime.hour;
        return hour >= start && hour < end;
      case RuleConditionType.weekday:
        final days = (condition.data?['days'] as List?)?.cast<int>() ?? const [];
        return days.contains(transaction.datetime.weekday);
    }
  }

  FinanceTransaction _apply(FinanceTransaction transaction, RuleAction action) {
    return transaction.copyWith(
      categoryId: action.categoryId ?? transaction.categoryId,
      tags: {...transaction.tags, ...action.tagsAdd}.toList(),
      planned: action.setPlanned ?? transaction.planned,
      note: action.noteTemplate ?? transaction.note,
    );
  }
}
