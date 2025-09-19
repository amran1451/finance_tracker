import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../services/backup_service.dart';

final settingsControllerProvider = Provider<SettingsController>((ref) {
  final backupService = ref.watch(backupServiceProvider);
  return SettingsController(backupService);
});

class SettingsController {
  SettingsController(this._backupService);

  final BackupService _backupService;

  Future<void> createBackup() => _backupService.createBackup();
}
