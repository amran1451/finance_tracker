import 'package:hive/hive.dart';

part 'limit.g.dart';

@HiveType(typeId: 1)
class Limit extends HiveObject {
  @HiveField(0)
  final String categoryId;

  @HiveField(1)
  final double amount;

  Limit({required this.categoryId, required this.amount});
}