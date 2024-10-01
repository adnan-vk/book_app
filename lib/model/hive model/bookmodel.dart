import 'package:hive_flutter/adapters.dart';
part 'bookmodel.g.dart';

@HiveType(typeId: 1)
class bookModel extends HiveObject {
  @HiveField(0)
  int? index;

  @HiveField(1)
  final String bookName;

  @HiveField(2)
  final String categery;

  @HiveField(3)
  final String details;

  @HiveField(4)
  final String review;

  bookModel(
      {required this.bookName,
      required this.categery,
      required this.details,
      required this.review,
      this.index});
}
