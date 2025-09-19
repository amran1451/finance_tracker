import 'package:flutter_test/flutter_test.dart';

import 'package:finance_tracker/features/common/controllers/filters_controller.dart';

void main() {
  test('FiltersNotifier updates fields', () {
    final notifier = FiltersNotifier();
    notifier.setPeriod('p1');
    notifier.setAccount('a1');
    notifier.setPlanned(true);
    expect(notifier.state.periodId, 'p1');
    expect(notifier.state.accountId, 'a1');
    expect(notifier.state.planned, true);
    notifier.clear();
    expect(notifier.state.periodId, isNull);
  });
}
