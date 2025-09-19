import 'package:hooks_riverpod/hooks_riverpod.dart';

enum PeriodMode { salary, calendar }

typedef OnboardingState = ({PeriodMode mode, String currency, bool importCsv});

class OnboardingNotifier extends StateNotifier<OnboardingState> {
  OnboardingNotifier()
      : super((mode: PeriodMode.salary, currency: 'RUB', importCsv: false));

  void setMode(PeriodMode mode) => state = (mode: mode, currency: state.currency, importCsv: state.importCsv);
  void setCurrency(String currency) =>
      state = (mode: state.mode, currency: currency, importCsv: state.importCsv);
  void toggleImportCsv(bool value) =>
      state = (mode: state.mode, currency: state.currency, importCsv: value);
}

final onboardingNotifierProvider =
    StateNotifierProvider<OnboardingNotifier, OnboardingState>((ref) => OnboardingNotifier());
