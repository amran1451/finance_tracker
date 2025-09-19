import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../data/models/plan_item.dart';
import '../../../data/repositories/plans_repo.dart';

final plansProvider = FutureProvider<List<PlanItem>>((ref) async {
  final repo = ref.watch(plansRepositoryProvider);
  return repo.fetchPlans();
});
