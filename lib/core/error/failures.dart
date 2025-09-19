abstract class Failure implements Exception {
  Failure(this.message);
  final String message;

  @override
  String toString() => message;
}

class DatabaseFailure extends Failure {
  DatabaseFailure(super.message);
}

class ValidationFailure extends Failure {
  ValidationFailure(super.message);
}

class BackupFailure extends Failure {
  BackupFailure(super.message);
}
