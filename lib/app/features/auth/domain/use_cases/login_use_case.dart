import 'package:dartz/dartz.dart';
import 'package:foods/app/core/error/export_error.dart';
import 'package:foods/app/core/use_case/use_case.dart';

import '../entities/login_info.dart';
import '../repositories/auth_repository.dart';

class LoginUseCase extends UseCase<LoginInfo, Params> {
  final AuthRepository _repository;

  LoginUseCase({
    required AuthRepository repository,
  }) : _repository = repository;

  @override
  Future<Either<Failure, LoginInfo>> call(Params params) {
    return _repository.login(
      phoneNumber: params.phoneNumber,
      password: params.password,
    );
  }
}

class Params {
  final String phoneNumber;
  final String password;

  Params({
    required this.phoneNumber,
    required this.password,
  });

  Map<String, dynamic> toJson() => <String, dynamic>{
        'phoneNumber': phoneNumber,
        'password': password,
      };
}
