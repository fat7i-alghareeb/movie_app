import 'package:hive_flutter/hive_flutter.dart';
part "movie_entity.g.dart";

@HiveType(typeId: 0)
class MovieEntity {
  @HiveField(0)
  final String poster;
  @HiveField(1)
  final String title;
  @HiveField(2)
  final String year;
  @HiveField(3)
  final String id;
  @HiveField(4)
  final String type;
  MovieEntity({
    required this.poster,
    required this.title,
    required this.year,
    required this.id,
    required this.type,
  });
}
