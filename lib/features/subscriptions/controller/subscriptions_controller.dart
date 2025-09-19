import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../data/models/subscription.dart';
import '../../../data/repositories/subscriptions_repo.dart';

final subscriptionsProvider = FutureProvider<List<Subscription>>((ref) async {
  final repo = ref.watch(subscriptionsRepositoryProvider);
  return repo.fetchSubscriptions();
});
