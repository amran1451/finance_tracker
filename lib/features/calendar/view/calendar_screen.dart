import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../common/widgets/app_scaffold.dart';
import '../controller/calendar_controller.dart';

class CalendarScreen extends ConsumerWidget {
  const CalendarScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final events = ref.watch(calendarEventsProvider);
    return AppScaffold(
      title: 'Calendar',
      body: ListView.separated(
        padding: const EdgeInsets.all(16),
        itemCount: events.length,
        separatorBuilder: (_, __) => const SizedBox(height: 8),
        itemBuilder: (context, index) {
          final event = events[index];
          return ListTile(
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
            tileColor: Theme.of(context).colorScheme.surface,
            title: Text(event.title),
            subtitle: Text(event.date.toLocal().toString().split(' ').first),
            trailing: const Icon(Icons.check_circle_outline),
          );
        },
      ),
    );
  }
}
