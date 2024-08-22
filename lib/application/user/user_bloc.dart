import 'package:appscrip/domain/core/failures/main_failure.dart';
import 'package:appscrip/domain/users/model/users/users.dart';
import 'package:appscrip/domain/users/users_service.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

part 'user_event.dart';
part 'user_state.dart';
part 'user_bloc.freezed.dart';

@injectable
class UserBloc extends Bloc<UserEvent, UserState> {
  final UsersService _usersServices;
  UserBloc(this._usersServices) : super(UserState.initial()) {
    //fetch users
    on<Initialize>((event, emit) async {
      emit(state.copyWith(isLoading: true));
      final result = await _usersServices.getallUsers();
      final newState = result.fold(
        (MainFailure l) {
          return state.copyWith(
            isLoading: false,
            isError: true,
          );
        },
        (List<Users> r) {
          return state.copyWith(
            userResultData: r,
            filteredUserResultData: r,
            isLoading: false,
            isError: false,
          );
        },
      );
      emit(newState);
    });
    //search users
    on<SearchUser>((event, emit) {
      final query = event.query.toLowerCase();
      final filteredData = state.userResultData.where((user) {
        final name = user.name?.toLowerCase() ?? '';
        return name.contains(query);
      }).toList();

      emit(state.copyWith(
        searchQuery: event.query,
        filteredUserResultData: filteredData,
      ));
    });
  }
}
