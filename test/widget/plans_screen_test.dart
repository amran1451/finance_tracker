import 'package:finance_tracker/data/models/plan_item.dart';
import 'package:finance_tracker/features/plans/controller/plans_controller.dart';
import 'package:finance_tracker/features/plans/view/plans_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

void main() {
  testWidgets('Plans screen renders list', (tester) async {
    final plans = [
      PlanItem(
        id: '1',
        title: 'Groceries',
        expectedAmount: 2000,
        deadline: DateTime(2024),
        periodId: 'current',
        flex: PlanFlex.fixed,
      ),
    ];

    await tester.pumpWidget(ProviderScope(
      overrides: [plansProvider.overrideWith((ref) async => plans)],
      child: const MaterialApp(home: PlansScreen()),
    ));

    await tester.pump();
    expect(find.text('Groceries'), findsOneWidget);
  });
}
