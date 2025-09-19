import 'package:finance_tracker/data/models/plan_item.dart';
import 'package:finance_tracker/features/plans/controller/plans_controller.dart';
import 'package:finance_tracker/features/plans/view/plans_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:golden_toolkit/golden_toolkit.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

void main() {
  setUpAll(() async {
    await loadAppFonts();
  });

  testGoldens('Plan card golden', (tester) async {
    final plan = PlanItem(
      id: '1',
      title: 'Groceries',
      expectedAmount: 2000,
      deadline: DateTime(2024),
      periodId: 'current',
      flex: PlanFlex.fixed,
    );

    final builder = GoldenBuilder.column()
      ..addScenario(
        'Plan card',
        ProviderScope(
          overrides: [plansProvider.overrideWithValue(AsyncValue.data([plan]))],
          child: const MaterialApp(home: PlansScreen()),
        ),
      );

    await tester.pumpWidgetBuilder(builder.build());
    await screenMatchesGolden(tester, 'plan_card');
  });
}
