import 'package:appscrip/domain/core/failures/main_failure.dart';
import 'package:appscrip/domain/users/model/users/users.dart';
import 'package:dartz/dartz.dart';

abstract class UsersService {
  Future<Either<MainFailure, List<Users>>> getallUsers();
}
