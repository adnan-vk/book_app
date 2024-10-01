import 'package:hive_flutter/adapters.dart';
part 'collectionmodel.g.dart';

@HiveType(typeId: 1)
class collectionModel extends HiveObject {
  @HiveField(0)
  int? index;

  @HiveField(1)
  final String categery;

  collectionModel({required this.categery, this.index});
}
