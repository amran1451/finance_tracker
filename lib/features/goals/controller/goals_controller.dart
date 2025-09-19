import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../data/models/goal.dart';
import '../../../data/repositories/goals_repo.dart';

final goalsProvider = FutureProvider<List<Goal>>((ref) async {
  final repo = ref.watch(goalsRepositoryProvider);
  return repo.fetchGoals();
});
