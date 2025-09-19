import 'package:flex_color_scheme/flex_color_scheme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'core/theme/app_theme.dart';
import 'features/home/view/home_screen.dart';
import 'features/onboarding/view/onboarding_screen.dart';
import 'features/plans/view/plans_screen.dart';
import 'features/quick_add/view/quick_add_sheet.dart';
import 'features/transactions/view/transactions_screen.dart';
import 'features/analytics/view/analytics_screen.dart';
import 'features/budget/view/budget_screen.dart';
import 'features/subscriptions/view/subscriptions_screen.dart';
import 'features/goals/view/goals_screen.dart';
import 'features/calendar/view/calendar_screen.dart';
import 'features/accounts/view/accounts_screen.dart';
import 'features/search/view/search_screen.dart';
import 'features/settings/view/settings_screen.dart';
import 'l10n/app_localizations.dart';

final _rootNavigatorKey = GlobalKey<NavigatorState>();
final _shellNavigatorKey = GlobalKey<NavigatorState>();

final routerProvider = Provider<GoRouter>((ref) {
  return GoRouter(
    navigatorKey: _rootNavigatorKey,
    initialLocation: '/onboarding',
    routes: [
      GoRoute(
        path: '/onboarding',
        name: OnboardingRoute.name,
        builder: (context, state) => const OnboardingScreen(),
      ),
      ShellRoute(
        navigatorKey: _shellNavigatorKey,
        builder: (context, state, child) => MainScaffold(child: child),
        routes: [
          GoRoute(
            path: '/home',
            name: HomeRoute.name,
            builder: (context, state) => const HomeScreen(),
          ),
          GoRoute(
            path: '/plans',
            name: PlansRoute.name,
            builder: (context, state) => const PlansScreen(),
          ),
          GoRoute(
            path: '/quick-add',
            name: QuickAddRoute.name,
            pageBuilder: (context, state) => const CustomTransitionPage(
              child: QuickAddSheet(),
              transitionsBuilder: _dialogTransition,
            ),
          ),
          GoRoute(
            path: '/transactions',
            name: TransactionsRoute.name,
            builder: (context, state) => const TransactionsScreen(),
          ),
          GoRoute(
            path: '/analytics',
            name: AnalyticsRoute.name,
            builder: (context, state) => const AnalyticsScreen(),
          ),
        ],
      ),
      GoRoute(
        path: '/budget',
        name: BudgetRoute.name,
        builder: (context, state) => const BudgetScreen(),
      ),
      GoRoute(
        path: '/subscriptions',
        name: SubscriptionsRoute.name,
        builder: (context, state) => const SubscriptionsScreen(),
      ),
      GoRoute(
        path: '/goals',
        name: GoalsRoute.name,
        builder: (context, state) => const GoalsScreen(),
      ),
      GoRoute(
        path: '/calendar',
        name: CalendarRoute.name,
        builder: (context, state) => const CalendarScreen(),
      ),
      GoRoute(
        path: '/accounts',
        name: AccountsRoute.name,
        builder: (context, state) => const AccountsScreen(),
      ),
      GoRoute(
        path: '/search',
        name: SearchRoute.name,
        builder: (context, state) => const SearchScreen(),
      ),
      GoRoute(
        path: '/settings',
        name: SettingsRoute.name,
        builder: (context, state) => const SettingsScreen(),
      ),
    ],
  );
});

class FinanceApp extends ConsumerWidget {
  const FinanceApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final router = ref.watch(routerProvider);
    final theme = ref.watch(appThemeProvider);
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      routerConfig: router,
      theme: theme.lightTheme,
      darkTheme: theme.darkTheme,
      themeMode: theme.themeMode,
      supportedLocales: const [Locale('en'), Locale('ru')],
      localizationsDelegates: const [
        AppLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
    );
  }
}

class MainScaffold extends ConsumerStatefulWidget {
  const MainScaffold({required this.child, super.key});

  final Widget child;

  @override
  ConsumerState<MainScaffold> createState() => _MainScaffoldState();
}

class _MainScaffoldState extends ConsumerState<MainScaffold> {
  int _indexFromLocation(String location) {
    if (location.startsWith('/plans')) return 1;
    if (location.startsWith('/transactions')) return 3;
    if (location.startsWith('/analytics')) return 4;
    return 0;
  }

  @override
  Widget build(BuildContext context) {
    final location = GoRouterState.of(context).uri.toString();
    final currentIndex = _indexFromLocation(location);
    return Scaffold(
      body: AnimatedSwitcher(
        duration: const Duration(milliseconds: 300),
        child: widget.child,
      ),
      bottomNavigationBar: NavigationBar(
        selectedIndex: currentIndex,
        onDestinationSelected: (index) {
          switch (index) {
            case 0:
              context.goNamed(HomeRoute.name);
              break;
            case 1:
              context.goNamed(PlansRoute.name);
              break;
            case 2:
              context.goNamed(QuickAddRoute.name);
              break;
            case 3:
              context.goNamed(TransactionsRoute.name);
              break;
            case 4:
              context.goNamed(AnalyticsRoute.name);
              break;
          }
        },
        destinations: const [
          NavigationDestination(icon: Icon(Icons.home_outlined), label: 'Home'),
          NavigationDestination(icon: Icon(Icons.check_circle_outline), label: 'Plans'),
          NavigationDestination(icon: Icon(Icons.add_circle_outline), label: 'Add'),
          NavigationDestination(icon: Icon(Icons.list_alt_outlined), label: 'Transactions'),
          NavigationDestination(icon: Icon(Icons.insights_outlined), label: 'Analytics'),
        ],
      ),
    );
  }
}

class HomeRoute {
  static const name = 'home';
}

class PlansRoute {
  static const name = 'plans';
}

class QuickAddRoute {
  static const name = 'quickAdd';
}

class TransactionsRoute {
  static const name = 'transactions';
}

class AnalyticsRoute {
  static const name = 'analytics';
}

class OnboardingRoute {
  static const name = 'onboarding';
}

class BudgetRoute {
  static const name = 'budget';
}

class SubscriptionsRoute {
  static const name = 'subscriptions';
}

class GoalsRoute {
  static const name = 'goals';
}

class CalendarRoute {
  static const name = 'calendar';
}

class AccountsRoute {
  static const name = 'accounts';
}

class SearchRoute {
  static const name = 'search';
}

class SettingsRoute {
  static const name = 'settings';
}

Widget _dialogTransition(BuildContext context, Animation<double> animation,
    Animation<double> secondaryAnimation, Widget child) {
  return FadeTransition(
    opacity: animation,
    child: ScaleTransition(
      scale: Tween<double>(begin: 0.95, end: 1).animate(animation),
      child: child,
    ),
  );
}
