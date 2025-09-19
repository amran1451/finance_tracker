import 'package:flutter_test/flutter_test.dart';

import 'package:finance_tracker/core/utils/reporting.dart';
import 'package:finance_tracker/data/models/plan_item.dart';
import 'package:finance_tracker/data/models/transaction.dart';

void main() {
  test('buildPeriodReport splits planned and unplanned totals', () {
    final transactions = [
      FinanceTransaction(
        id: '1',
        datetime: DateTime(2024),
        amount: -100,
        currency: 'RUB',
        accountId: 'card',
        type: TransactionType.expense,
        planned: true,
      ),
      FinanceTransaction(
        id: '2',
        datetime: DateTime(2024),
        amount: -50,
        currency: 'RUB',
        accountId: 'card',
        type: TransactionType.expense,
        planned: false,
      ),
    ];

    final report = buildPeriodReport(transactions);
    expect(report.plannedTotal, 100);
    expect(report.unplannedTotal, 50);
  });

  test('carryOverPlans only returns unfinished plans', () {
    final plans = [
      PlanItem(
        id: '1',
        title: 'Groceries',
        expectedAmount: 1000,
        deadline: DateTime(2024),
        periodId: 'current',
        flex: PlanFlex.fixed,
        done: true,
      ),
      PlanItem(
        id: '2',
        title: 'Gift',
        expectedAmount: 2000,
        deadline: DateTime(2024),
        periodId: 'current',
        flex: PlanFlex.elastic,
        done: false,
      ),
    ];

    final carry = carryOverPlans(plans, carryIncomplete: true);
    expect(carry.length, 1);
    expect(carry.first.id, '2_next');
  });

  test('computeCarryOverAmount respects percentage limit', () {
    final amount = computeCarryOverAmount(1000, 400, 50);
    expect(amount, 300);
    final amountNone = computeCarryOverAmount(500, 600, 80);
    expect(amountNone, 0);
  });

  test('carryOverPlans returns empty when disabled', () {
    final plans = [
      PlanItem(
        id: '10',
        title: 'Utilities',
        expectedAmount: 1000,
        deadline: DateTime(2024),
        periodId: 'current',
        flex: PlanFlex.fixed,
        done: false,
      ),
    ];

    final carry = carryOverPlans(plans, carryIncomplete: false);
    expect(carry, isEmpty);
  });
}
