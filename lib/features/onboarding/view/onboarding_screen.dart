import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../app.dart';
import '../../../l10n/app_localizations.dart';
import '../../common/widgets/app_scaffold.dart';
import '../controller/onboarding_controller.dart';

class OnboardingScreen extends ConsumerWidget {
  const OnboardingScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(onboardingNotifierProvider);
    final l10n = AppLocalizations.of(context);
    return AppScaffold(
      title: l10n.onboardingTitle,
      body: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Choose your paycheck rhythm',
              style: Theme.of(context).textTheme.headlineSmall,
            ),
            const SizedBox(height: 16),
            SegmentedButton<PeriodMode>(
              segments: const [
                ButtonSegment(value: PeriodMode.salary, label: Text('Advance/Salary'), icon: Icon(Icons.calendar_month)),
                ButtonSegment(value: PeriodMode.calendar, label: Text('Calendar'), icon: Icon(Icons.event))
              ],
              selected: {state.mode},
              onSelectionChanged: (value) =>
                  ref.read(onboardingNotifierProvider.notifier).setMode(value.first),
            ),
            const SizedBox(height: 24),
            DropdownButtonFormField<String>(
              value: state.currency,
              decoration: const InputDecoration(labelText: 'Default currency'),
              items: const [
                DropdownMenuItem(value: 'RUB', child: Text('₽ RUB')),
                DropdownMenuItem(value: 'USD', child: Text('USD')),
                DropdownMenuItem(value: 'EUR', child: Text('EUR')),
              ],
              onChanged: (value) {
                if (value != null) {
                  ref.read(onboardingNotifierProvider.notifier).setCurrency(value);
                }
              },
            ),
            const SizedBox(height: 16),
            SwitchListTile(
              title: const Text('Import CSV after onboarding'),
              subtitle: const Text('You can import data from other apps later as well'),
              value: state.importCsv,
              onChanged: (value) =>
                  ref.read(onboardingNotifierProvider.notifier).toggleImportCsv(value),
            ),
            const Spacer(),
            FilledButton(
              onPressed: () => context.goNamed(HomeRoute.name),
              style: FilledButton.styleFrom(minimumSize: const Size.fromHeight(48)),
              child: const Text('Start tracking'),
            )
          ],
        ),
      ),
    );
  }
}
