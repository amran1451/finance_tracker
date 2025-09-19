import 'package:finance_tracker/features/analytics/controller/analytics_controller.dart';
import 'package:finance_tracker/features/analytics/view/analytics_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

void main() {
  testWidgets('Analytics screen shows metrics', (tester) async {
    final overview = AnalyticsOverview(
      planned: 1000,
      unplanned: 500,
      heatmap: {DateTime(2024): 200},
    );

    await tester.pumpWidget(ProviderScope(
      overrides: [analyticsOverviewProvider.overrideWithValue(AsyncValue.data(overview))],
      child: const MaterialApp(home: AnalyticsScreen()),
    ));

    await tester.pump();
    expect(find.text('Plan vs fact'), findsOneWidget);
  });
}
