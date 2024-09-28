import 'dart:developer';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:movie_app/constants.dart';
import '../../entities/user_entity.dart';
import 'user_info_state.dart';

class UserInfoCubit extends Cubit<UserInfoState> {
  UserInfoCubit() : super(UserInfoInitial());
  final userBox = Hive.box<UserEntity>(Constants.kUserBox);
  late final UserEntity _user =
      userBox.isNotEmpty ? userBox.getAt(0)! : UserEntity(isDarkTheme: false);

  Future<void> saveUser() async {
    if (userBox.isEmpty) {
      await userBox.add(_user);
    }
  }

  get isDarkTheme {
    if (userBox.isNotEmpty) {
      return user.isDarkTheme;
    } else {
      return false;
    }
  }

  UserEntity get user => userBox.getAt(0)!;
  void changeTheme(bool newTheme) {
    user.isDarkTheme = newTheme;
    log(user.isDarkTheme.toString());
    userBox.putAt(0, user);

    emit(EditThemeUserInfo());
  }
}
