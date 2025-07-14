import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'models/transaction.dart';
import 'screens/transactions_list_screen.dart';
import 'screens/add_transaction_screen.dart';
import 'screens/dashboard_screen.dart';
import 'screens/plans_screen.dart';
import 'screens/reports_screen.dart';
import 'models/limit.dart';
import 'theme_notifier.dart';
import 'screens/expense_screen.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();

  Hive.registerAdapter(FinTransactionAdapter());
  Hive.registerAdapter(LimitAdapter());

  await Hive.openBox<FinTransaction>('transactions');
  await Hive.openBox<Limit>('limits');

  final themeNotifier = ThemeNotifier();
  await themeNotifier.loadTheme();

  runApp(MyApp(themeNotifier: themeNotifier));
}

class MyApp extends StatefulWidget {
  final ThemeNotifier? themeNotifier;
  const MyApp({Key? key, this.themeNotifier}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  late final ThemeNotifier _themeNotifier;

  @override
  void initState() {
    super.initState();
    _themeNotifier = widget.themeNotifier ?? ThemeNotifier();
    if (widget.themeNotifier == null) {
      _themeNotifier.loadTheme();
    }
  }

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<ThemeMode>(
      valueListenable: _themeNotifier,
      builder: (context, mode, _) {
        return MaterialApp(
          title: 'Finance Tracker',
          theme: ThemeData.light(),
          darkTheme: ThemeData.dark(),
          themeMode: mode,
          home: RootScreen(themeNotifier: _themeNotifier),
          routes: {
            '/plans': (_) => const PlansScreen(),
            '/reports': (_) => const ReportsScreen(),
          },
        );
      },
    );
  }
}

class RootScreen extends StatefulWidget {
  final ThemeNotifier themeNotifier;
  const RootScreen({Key? key, required this.themeNotifier}) : super(key: key);

  @override
  State<RootScreen> createState() => _RootScreenState();
}

class _RootScreenState extends State<RootScreen> {
  int _currentIndex = 1; // 0 = Transactions, 1 = Dashboard

  late final List<Widget> _screens;

  void _showTransactions() => setState(() => _currentIndex = 0);
  void _showDashboard() => setState(() => _currentIndex = 1);
  void _handleBack() => _showTransactions();

  @override
  void initState() {
    super.initState();
    _screens = [
      const TransactionsListScreen(),
      DashboardScreen(
        themeNotifier: widget.themeNotifier,
        onBack: _handleBack,
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _screens[_currentIndex],
      bottomNavigationBar: BottomAppBar(
        shape: const CircularNotchedRectangle(),
        notchMargin: 6.0,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            IconButton(
              icon: const Icon(Icons.list),
              onPressed: _showTransactions,
            ),
            const SizedBox(width: 48), // space for FAB
            IconButton(
              icon: const Icon(Icons.bar_chart),
              onPressed: _showTransactions,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (_) => const AddTransactionScreen()),
          );
        },
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }
}