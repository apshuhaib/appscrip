// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:appscrip/application/user/user_bloc.dart' as _i29;
import 'package:appscrip/domain/users/users_service.dart' as _i612;
import 'package:appscrip/infrastructure/users_service_ipml.dart' as _i700;
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;

extension GetItInjectableX on _i174.GetIt {
// initializes the registration of main-scope dependencies inside of GetIt
  _i174.GetIt init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i526.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    gh.lazySingleton<_i612.UsersService>(() => _i700.UsersServiceImpl());
    gh.factory<_i29.UserBloc>(() => _i29.UserBloc(gh<_i612.UsersService>()));
    return this;
  }
}
