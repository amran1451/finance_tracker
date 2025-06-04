import 'package:hive/hive.dart';

part 'transaction.g.dart';

@HiveType(typeId: 0)
class FinTransaction extends HiveObject {
  @HiveField(0)
  final String id;

  @HiveField(1)
  final DateTime date;

  @HiveField(2)
  final double amount;

  @HiveField(3)
  final String categoryId;

  @HiveField(4)
  final String accountId;

  @HiveField(5)
  final String? comment;

  FinTransaction({
    required this.id,
    required this.date,
    required this.amount,
    required this.categoryId,
    required this.accountId,
    this.comment,
  });
}
