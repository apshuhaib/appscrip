import 'dart:developer';

import 'package:appscrip/domain/core/api_endpoints.dart';
import 'package:appscrip/domain/core/failures/main_failure.dart';
import 'package:appscrip/domain/users/model/users/users.dart';
import 'package:appscrip/domain/users/users_service.dart';
import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:dio/dio.dart';

@LazySingleton(as: UsersService)
class UsersServiceImpl implements UsersService {
  @override
  Future<Either<MainFailure, List<Users>>> getallUsers() async {
    try {
      final Response response =
          await Dio(BaseOptions()).get(ApiEndpoints.users);
      // log(response.data.toString());
      if (response.statusCode == 200 || response.statusCode == 201) {
        final List<dynamic> data = response.data;
        print(response.statusCode);
        final List<Users> users =
            data.map((json) => Users.fromJson(json)).toList();
        return Right(users);
      } else {
        return const Left(MainFailure.serverFailure());
      }
    } catch (e) {
      log(e.toString());
      return const Left(MainFailure.clientFailure());
    }
  }
}
