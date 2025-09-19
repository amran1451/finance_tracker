import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../common/widgets/app_scaffold.dart';
import '../controller/subscriptions_controller.dart';

class SubscriptionsScreen extends ConsumerWidget {
  const SubscriptionsScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final subscriptionsAsync = ref.watch(subscriptionsProvider);
    return AppScaffold(
      title: 'Subscriptions',
      body: subscriptionsAsync.when(
        data: (subscriptions) => ListView.separated(
          padding: const EdgeInsets.all(16),
          itemCount: subscriptions.length,
          separatorBuilder: (_, __) => const SizedBox(height: 8),
          itemBuilder: (context, index) {
            final subscription = subscriptions[index];
            return ListTile(
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
              tileColor: Theme.of(context).colorScheme.surface,
              title: Text(subscription.provider),
              subtitle: Text('Next charge ${subscription.nextCharge.toLocal().toString().split(' ').first}'),
              trailing: Text('${subscription.amount.toStringAsFixed(0)} ${subscription.currency}'),
            );
          },
        ),
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (error, stack) => Center(child: Text('Error: $error')),
      ),
    );
  }
}
