import 'package:flutter/material.dart';
import 'package:foods/app/features/auth/data/datasources/auth_remote_datasource.dart';
import 'package:foods/app/features/auth/domain/use_cases/login_use_case.dart';
import 'package:get/get.dart';

import '../../../../core/error/failures.dart';
import '../../data/repositories/auth_repository_impl.dart';
import '../../domain/entities/login_info.dart';
import 'login_controller.dart';

class LoginPage extends GetView<LoginController> {
  const LoginPage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisSize: MainAxisSize.max,
        children: [
          InkWell(
            onTap: () async {
              final useCase = LoginUseCase(
                repository: AuthRepositoryImpl(
                  remoteDatasource: AuthRemoteDatasourceImpl(),
                ),
              );

              final result = await useCase.call(
                Params(
                  phoneNumber: "9sadasdasd99",
                  password: "Aa@121212",
                ),
              );

              result.fold(
                (Failure failure) {
                  print(
                    failure.message,
                  );
                },
                (LoginInfo loginInfo) {
                  print(
                    loginInfo.token,
                  );
                },
              );
            },
            child: Text(
              'Login',
              style: TextStyle(
                fontSize: 30,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
