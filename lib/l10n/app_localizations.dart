import 'package:flutter/widgets.dart';

class AppLocalizations {
  AppLocalizations(this.locale);

  final Locale locale;

  static const LocalizationsDelegate<AppLocalizations> delegate =
      _AppLocalizationsDelegate();

  static const _localizedStrings = {
    'en': {
      'appTitle': 'FinVault',
      'onboardingTitle': 'Take control of your money',
      'homeSafeToSpend': 'Safe to spend',
      'plansTitle': 'Plans',
      'quickAddTitle': 'Quick add',
      'transactionsTitle': 'Transactions',
      'analyticsTitle': 'Analytics',
      'budgetTitle': 'Budget',
      'subscriptionsTitle': 'Subscriptions',
      'goalsTitle': 'Goals',
      'calendarTitle': 'Calendar',
      'accountsTitle': 'Accounts',
      'searchTitle': 'Search',
      'settingsTitle': 'Settings',
    },
    'ru': {
      'appTitle': 'FinVault',
      'onboardingTitle': 'Контролируйте финансы',
      'homeSafeToSpend': 'Можно потратить',
      'plansTitle': 'Планы',
      'quickAddTitle': 'Быстрый ввод',
      'transactionsTitle': 'Транзакции',
      'analyticsTitle': 'Аналитика',
      'budgetTitle': 'Бюджет',
      'subscriptionsTitle': 'Подписки',
      'goalsTitle': 'Цели',
      'calendarTitle': 'Календарь',
      'accountsTitle': 'Счета',
      'searchTitle': 'Поиск',
      'settingsTitle': 'Настройки',
    }
  };

  static AppLocalizations of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations)!;
  }

  String _get(String key) {
    return _localizedStrings[locale.languageCode]?[key] ??
        _localizedStrings['en']![key] ?? key;
  }

  String get appTitle => _get('appTitle');
  String get onboardingTitle => _get('onboardingTitle');
  String get homeSafeToSpend => _get('homeSafeToSpend');
  String get plansTitle => _get('plansTitle');
  String get quickAddTitle => _get('quickAddTitle');
  String get transactionsTitle => _get('transactionsTitle');
  String get analyticsTitle => _get('analyticsTitle');
  String get budgetTitle => _get('budgetTitle');
  String get subscriptionsTitle => _get('subscriptionsTitle');
  String get goalsTitle => _get('goalsTitle');
  String get calendarTitle => _get('calendarTitle');
  String get accountsTitle => _get('accountsTitle');
  String get searchTitle => _get('searchTitle');
  String get settingsTitle => _get('settingsTitle');
}

class _AppLocalizationsDelegate
    extends LocalizationsDelegate<AppLocalizations> {
  const _AppLocalizationsDelegate();

  @override
  bool isSupported(Locale locale) => ['en', 'ru'].contains(locale.languageCode);

  @override
  Future<AppLocalizations> load(Locale locale) async {
    return AppLocalizations(locale);
  }

  @override
  bool shouldReload(_AppLocalizationsDelegate old) => false;
}
