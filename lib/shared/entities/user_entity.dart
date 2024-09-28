import 'package:hive_flutter/hive_flutter.dart';
part "user_entity.g.dart";

@HiveType(typeId: 1)
class UserEntity extends HiveObject {
  @HiveField(0)
  bool isDarkTheme;
  UserEntity({
    required this.isDarkTheme,
  });
}
