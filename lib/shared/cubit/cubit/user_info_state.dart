import '../../entities/user_entity.dart';

abstract class UserInfoState {}

final class UserInfoInitial extends UserInfoState {}

final class EditThemeUserInfo extends UserInfoState {}

final class EditInfoState extends UserInfoState {
  final UserEntity user;

  EditInfoState({required this.user});
}
