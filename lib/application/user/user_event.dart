part of 'user_bloc.dart';

@freezed
class UserEvent with _$UserEvent {
  const factory UserEvent.initialize() = Initialize;
  const factory UserEvent.searchUser(String query) = SearchUser;
}
//comment