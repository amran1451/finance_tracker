import 'dart:convert';
import 'dart:io';
import 'dart:typed_data';

import 'package:crypto/crypto.dart';
import 'package:encrypt/encrypt.dart' as encrypt;
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:path/path.dart' as p;
import 'package:path_provider/path_provider.dart';

import '../core/error/failures.dart';
import '../data/repositories/transactions_repo.dart';

final backupServiceProvider = Provider<BackupService>((ref) {
  final storage = const FlutterSecureStorage();
  final transactionsRepo = ref.watch(transactionsRepositoryProvider);
  return BackupService(storage, transactionsRepo);
});

class BackupService {
  BackupService(this._secureStorage, this._transactionsRepository);

  final FlutterSecureStorage _secureStorage;
  final TransactionsRepositoryBase _transactionsRepository;

  Future<void> createBackup() async {
    final key = await _obtainKey();
    final transactions = await _transactionsRepository.fetchTransactions();
    final payload = jsonEncode(transactions.map((e) => e.toJson()).toList());
    final encrypted = _encryptPayload(payload, key);
    final dir = await getApplicationDocumentsDirectory();
    final file = File(p.join(dir.path, 'finvault.finvault'));
    await file.writeAsBytes(encrypted);
  }

  Future<void> restoreBackup(File file) async {
    final key = await _obtainKey();
    final bytes = await file.readAsBytes();
    final decrypted = _decryptPayload(bytes, key);
    // Restoration stub: this is where parsed transactions would be reinserted.
    throw BackupFailure('Restore is not implemented yet: $decrypted');
  }

  Future<Uint8List> _obtainKey() async {
    const keyName = 'finvault_encryption_key';
    var key = await _secureStorage.read(key: keyName);
    if (key == null) {
      final salt = utf8.encode('finvault_salt');
      final passphrase = DateTime.now().millisecondsSinceEpoch.toString();
      var hash = utf8.encode(passphrase + base64Encode(salt));
      for (var i = 0; i < 500; i++) {
        hash = Uint8List.fromList(sha256.convert(hash).bytes);
      }
      key = base64Encode(hash);
      await _secureStorage.write(key: keyName, value: key);
    }
    return Uint8List.fromList(base64Decode(key));
  }

  Uint8List _encryptPayload(String payload, Uint8List keyBytes) {
    final iv = encrypt.IV.fromLength(16);
    final key = encrypt.Key(keyBytes.sublist(0, 32));
    final encrypter = encrypt.Encrypter(encrypt.AES(key));
    final encrypted = encrypter.encrypt(payload, iv: iv);
    return Uint8List.fromList(encrypted.bytes);
  }

  String _decryptPayload(Uint8List bytes, Uint8List keyBytes) {
    final iv = encrypt.IV.fromLength(16);
    final key = encrypt.Key(keyBytes.sublist(0, 32));
    final encrypter = encrypt.Encrypter(encrypt.AES(key));
    return encrypter.decrypt(encrypt.Encrypted(bytes), iv: iv);
  }
}
