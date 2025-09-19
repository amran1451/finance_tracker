import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../data/models/account.dart';
import '../../../data/repositories/accounts_repo.dart';

final accountsProvider = FutureProvider<List<Account>>((ref) async {
  final repo = ref.watch(accountsRepositoryProvider);
  return repo.fetchAccounts();
});
