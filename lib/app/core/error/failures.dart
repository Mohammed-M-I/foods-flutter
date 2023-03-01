import 'package:equatable/equatable.dart';
import 'package:foods/app/core/values/app_strings.dart';
import 'package:get/get.dart';

abstract class Failure extends Equatable {
  final String message; // Must be translated
  final List<Object?> properties;

  const Failure({
    this.message = AppStrings.failure,
    this.properties = const [],
  });

  @override
  List<Object?> get props => properties;
}

class ServerFailure extends Failure {
  const ServerFailure({
    String? message,
  }) : super(
          message: message ?? AppStrings.serverFailure,
        );
}

class LocalFailure extends Failure {
  const LocalFailure({
    String? message,
  }) : super(
          message: message ?? AppStrings.localFailure,
        );
}

class NoInternetConnectionFailure extends Failure {
  const NoInternetConnectionFailure({
    String? message,
  }) : super(
          message: message ?? AppStrings.noInternetConnection,
        );
}
