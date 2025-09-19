import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../common/widgets/app_scaffold.dart';
import '../controller/settings_controller.dart';

class SettingsScreen extends ConsumerWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final controller = ref.watch(settingsControllerProvider);
    return AppScaffold(
      title: 'Settings',
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          ListTile(
            leading: const Icon(Icons.backup_outlined),
            title: const Text('Create encrypted backup'),
            subtitle: const Text('Saves a .finvault file in your documents folder'),
            onTap: () async {
              await controller.createBackup();
              if (context.mounted) {
                ScaffoldMessenger.of(context)
                    .showSnackBar(const SnackBar(content: Text('Backup created')));
              }
            },
          ),
          const Divider(),
          const ListTile(
            leading: Icon(Icons.lock_outline),
            title: Text('Privacy'),
            subtitle: Text('PIN & biometrics'),
          ),
          const ListTile(
            leading: Icon(Icons.tune),
            title: Text('Rules engine'),
            subtitle: Text('Manage automation rules'),
          ),
        ],
      ),
    );
  }
}
