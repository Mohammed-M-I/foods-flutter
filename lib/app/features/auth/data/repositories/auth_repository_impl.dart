import 'package:dartz/dartz.dart';
import 'package:foods/app/core/error/export_error.dart';
import 'package:foods/app/core/error/failures.dart';
import 'package:foods/app/features/auth/domain/entities/login_info.dart';

import '../../domain/repositories/auth_repository.dart';
import '../datasources/auth_remote_datasource.dart';
import '../models/remote/request/login_request_dto.dart';
import '../models/remote/request/register_request_dto.dart';

class AuthRepositoryImpl implements AuthRepository {
  final AuthRemoteDatasource _remoteDatasource;

  AuthRepositoryImpl({
    required AuthRemoteDatasource remoteDatasource,
  }) : _remoteDatasource = remoteDatasource;

  @override
  Future<Either<Failure, LoginInfo>> login({
    required String phoneNumber,
    required String password,
  }) async {
    try {
      final result = await _remoteDatasource.login(
        data: LoginRequestDto(
          phoneNumber: phoneNumber,
          password: password,
        ),
      );

      return Right(
        result!,
      );
    } on ServerException catch (exception) {
      return Left(
        ServerFailure(
          message: exception.message,
        ),
      );
    } on LocalException catch (exception) {
      return Left(
        LocalFailure(
          message: exception.message,
        ),
      );
    }
  }

  @override
  Future<Either<Failure, void>> register({
    required String nickName,
    required String phoneNumber,
    required String password,
  }) async {
    try {
      await _remoteDatasource.register(
        data: RegisterRequestDto(
          nickName: nickName,
          phoneNumber: phoneNumber,
          password: password,
        ),
      );

      return const Right(
        null,
      );
    } on ServerException catch (exception) {
      return Left(
        ServerFailure(
          message: exception.message,
        ),
      );
    } on LocalException catch (exception) {
      return Left(
        LocalFailure(
          message: exception.message,
        ),
      );
    }
  }
}
