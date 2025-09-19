import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../core/utils/currency_format.dart';
import '../../common/widgets/app_scaffold.dart';
import '../controller/search_controller.dart';

class SearchScreen extends ConsumerWidget {
  const SearchScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final resultsAsync = ref.watch(searchResultsProvider);
    return AppScaffold(
      title: 'Search',
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16),
            child: TextField(
              decoration: const InputDecoration(labelText: 'Find transaction'),
              onChanged: (value) => ref.read(searchQueryProvider.notifier).state = value,
            ),
          ),
          Expanded(
            child: resultsAsync.when(
              data: (results) => ListView.builder(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                itemCount: results.length,
                itemBuilder: (context, index) {
                  final tx = results[index];
                  return ListTile(
                    title: Text(formatCurrency(tx.amount)),
                    subtitle: Text(tx.note ?? ''),
                  );
                },
              ),
              loading: () => const Center(child: CircularProgressIndicator()),
              error: (error, stack) => Center(child: Text('Error: $error')),
            ),
          )
        ],
      ),
    );
  }
}
