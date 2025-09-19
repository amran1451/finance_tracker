import 'package:flutter_test/flutter_test.dart';

import 'package:finance_tracker/data/models/rule.dart';
import 'package:finance_tracker/data/models/transaction.dart';
import 'package:finance_tracker/services/rules_engine.dart';

void main() {
  test('applies highest priority matching rule', () async {
    final transaction = FinanceTransaction(
      id: '1',
      datetime: DateTime(2024),
      amount: -120,
      currency: 'RUB',
      accountId: 'card',
      type: TransactionType.expense,
      note: 'coffee shop',
    );

    final rules = [
      Rule(
        id: 'rule1',
        priority: 0,
        condition: RuleCondition(type: RuleConditionType.textMatch, data: {'query': 'coffee'}),
        action: RuleAction(categoryId: 'cafes', tagsAdd: ['treat'], setPlanned: true),
      ),
      Rule(
        id: 'rule2',
        priority: 1,
        condition: RuleCondition(type: RuleConditionType.textMatch, data: {'query': 'coffee'}),
        action: RuleAction(categoryId: 'priority', tagsAdd: ['focus'], setPlanned: false),
      ),
    ];

    final engine = RulesEngine(() async => rules);
    final updated = await engine.applyRules(transaction);

    expect(updated.categoryId, 'priority');
    expect(updated.tags, contains('focus'));
    expect(updated.planned, false);
  });

  test('matches amount range correctly', () async {
    final transaction = FinanceTransaction(
      id: '2',
      datetime: DateTime(2024),
      amount: -500,
      currency: 'RUB',
      accountId: 'card',
      type: TransactionType.expense,
    );

    final rules = [
      Rule(
        id: 'rule_range',
        priority: 0,
        condition: RuleCondition(type: RuleConditionType.amountRange, data: {'min': 100, 'max': 700}),
        action: RuleAction(categoryId: 'range'),
      ),
    ];

    final engine = RulesEngine(() async => rules);
    final updated = await engine.applyRules(transaction);

    expect(updated.categoryId, 'range');
  });

  test('weekday rule', () async {
    final transaction = FinanceTransaction(
      id: '3',
      datetime: DateTime(2024, 6, 3),
      amount: -50,
      currency: 'RUB',
      accountId: 'card',
      type: TransactionType.expense,
    );

    final rules = [
      Rule(
        id: 'weekday',
        priority: 0,
        condition: RuleCondition(type: RuleConditionType.weekday, data: {'days': [1, 2, 3]}),
        action: RuleAction(categoryId: 'weekday'),
      ),
    ];

    final engine = RulesEngine(() async => rules);
    final updated = await engine.applyRules(transaction);

    expect(updated.categoryId, 'weekday');
  });
}
