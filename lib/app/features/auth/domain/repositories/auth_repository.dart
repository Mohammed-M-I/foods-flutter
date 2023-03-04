import 'package:dartz/dartz.dart';
import 'package:foods/app/core/error/export_error.dart';

import '../entities/login_info.dart';

abstract class AuthRepository {
  Future<Either<Failure, LoginInfo>> login({
    required String phoneNumber,
    required String password,
  });

  Future<Either<Failure, void>> register({
    required String nickName,
    required String phoneNumber,
    required String password,
  });
}
