part of 'user_bloc.dart';

@freezed
class UserState with _$UserState {
  const factory UserState({
    required List<Users> userResultData,
    required List<Users> filteredUserResultData,
    required bool isLoading,
    required bool isError,
    required String searchQuery,
  }) = _UserState;
  factory UserState.initial() => const UserState(
        userResultData: [],
        filteredUserResultData: [],
        isLoading: false,
        isError: false,
        searchQuery: '',
      );
}
//comment