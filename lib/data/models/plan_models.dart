import '../db/app_database.dart';

class PlanItemProgress {
  PlanItemProgress({
    required this.item,
    required this.paidAmount,
    required this.remaining,
    required this.isDone,
  });

  final PlanItemsTableData item;
  final int paidAmount;
  final int remaining;
  final bool isDone;
}

class CriticalitySlice {
  CriticalitySlice({
    required this.criticality,
    required this.totalAmount,
    required this.share,
  });

  final CriticalityTableData criticality;
  final int totalAmount;
  final double share;
}

class PeriodSummary {
  PeriodSummary({
    required this.period,
    required this.safeToSpend,
    required this.totalIncome,
    required this.totalExpenses,
    required this.plannedExpenses,
    required this.unplannedExpenses,
    required this.planExpected,
    required this.criticalitySlices,
  });

  final PaycheckPeriodsTableData period;
  final int safeToSpend;
  final int totalIncome;
  final int totalExpenses;
  final int plannedExpenses;
  final int unplannedExpenses;
  final int planExpected;
  final List<CriticalitySlice> criticalitySlices;
}
