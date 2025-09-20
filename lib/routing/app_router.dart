import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../features/home/home_screen.dart';
import '../features/plan/plan_screen.dart';
import '../features/quick_entry/quick_entry_sheet.dart';
import '../features/settings/settings_screen.dart';
import '../features/transactions/transactions_screen.dart';

final routerProvider = Provider<GoRouter>((ref) {
  return GoRouter(
    initialLocation: HomeScreen.routePath,
    routes: [
      StatefulShellRoute.indexedStack(
        builder: (context, state, navigationShell) => AppShell(
          navigationShell: navigationShell,
        ),
        branches: [
          StatefulShellBranch(routes: [
            GoRoute(
              path: HomeScreen.routePath,
              builder: (context, state) => const HomeScreen(),
            ),
          ]),
          StatefulShellBranch(routes: [
            GoRoute(
              path: TransactionsScreen.routePath,
              builder: (context, state) => const TransactionsScreen(),
            ),
          ]),
          StatefulShellBranch(routes: [
            GoRoute(
              path: SettingsScreen.routePath,
              builder: (context, state) => const SettingsScreen(),
            ),
          ]),
        ],
      ),
      GoRoute(
        path: PlanScreen.routePath,
        builder: (context, state) => const PlanScreen(),
      ),
    ],
  );
});

class AppShell extends HookConsumerWidget {
  const AppShell({required this.navigationShell, super.key});

  final StatefulNavigationShell navigationShell;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final currentBranchIndex = navigationShell.currentIndex;
    final selectedNavIndex = currentBranchIndex == 0
        ? 0
        : currentBranchIndex == 1
            ? 2
            : 3;

    return Scaffold(
      body: navigationShell,
      bottomNavigationBar: NavigationBar(
        selectedIndex: selectedNavIndex,
        onDestinationSelected: (index) {
          if (index == 1) {
            showQuickEntrySheet(context, ref);
            return;
          }
          final branchIndex = index > 1 ? index - 1 : index;
          navigationShell.goBranch(branchIndex);
        },
        destinations: const [
          NavigationDestination(icon: Icon(Icons.home_outlined), label: 'Дом'),
          NavigationDestination(icon: Icon(Icons.add_circle_outline), label: 'Быстрый ввод'),
          NavigationDestination(icon: Icon(Icons.list_alt), label: 'Транзакции'),
          NavigationDestination(icon: Icon(Icons.settings), label: 'Настройки'),
        ],
      ),
    );
  }
}
