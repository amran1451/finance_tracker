import 'dart:async';

import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../data/db/app_database.dart';
import '../../data/models/plan_models.dart';
import '../../data/repositories/periods_repository.dart';
import '../../data/repositories/plan_repository.dart';
import '../../data/repositories/summary_repository.dart';

final activePeriodProvider = StreamProvider<PaycheckPeriodsTableData?>((ref) {
  final repository = ref.watch(periodsRepositoryProvider);
  return repository.watchActivePeriod();
});

final periodSummaryProvider = StreamProvider<PeriodSummary?>((ref) {
  final summaryRepo = ref.watch(summaryRepositoryProvider);
  final periodAsync = ref.watch(activePeriodProvider);
  return periodAsync.when<Stream<PeriodSummary?>>(
    data: (period) {
      if (period == null) {
        return const Stream<PeriodSummary?>.empty();
      }
      return summaryRepo.watchSummary(period);
    },
    loading: () => Stream.value(null),
    error: (error, stackTrace) => Stream.error(error, stackTrace),
  );
});

final planItemsProvider = StreamProvider.autoDispose<List<PlanItemProgress>>((ref) {
  final periodAsync = ref.watch(activePeriodProvider);
  final planRepo = ref.watch(planRepositoryProvider);
  return periodAsync.when<Stream<List<PlanItemProgress>>>(
    data: (period) {
      if (period == null) {
        return const Stream<List<PlanItemProgress>>.empty();
      }
      return planRepo.watchPlanForPeriod(period.id);
    },
    loading: () => Stream.value(const <PlanItemProgress>[]),
    error: (error, stackTrace) => Stream.error(error, stackTrace),
  );
});
