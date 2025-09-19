import '../../data/models/plan_item.dart';
import '../../data/models/transaction.dart';

class PeriodReport {
  const PeriodReport({required this.plannedTotal, required this.unplannedTotal});
  final double plannedTotal;
  final double unplannedTotal;
}

PeriodReport buildPeriodReport(List<FinanceTransaction> transactions) {
  final planned = transactions
      .where((tx) => tx.planned)
      .fold<double>(0, (sum, tx) => sum + tx.amount.abs());
  final unplanned = transactions
      .where((tx) => !tx.planned)
      .fold<double>(0, (sum, tx) => sum + tx.amount.abs());
  return PeriodReport(plannedTotal: planned, unplannedTotal: unplanned);
}

List<PlanItem> carryOverPlans(List<PlanItem> plans, {required bool carryIncomplete}) {
  if (!carryIncomplete) return const [];
  return plans.where((plan) => !plan.done).map((plan) => plan.copyWith(id: '${plan.id}_next')).toList();
}

double computeCarryOverAmount(double limit, double spent, double? carryOverPct) {
  if (limit <= spent) return 0;
  final remaining = limit - spent;
  if (carryOverPct == null) return remaining;
  return remaining * (carryOverPct / 100);
}
