import 'package:dartz/dartz.dart';
import 'package:foods/app/core/error/export_error.dart';
import 'package:foods/app/core/utils/app_network_utils.dart';
import '../../../categories/domain/entities/mappers/category_mappers.dart';

import '../../domain/entities/category.dart';
import '../../domain/repositories/categories_repository.dart';
import '../datasources/categories_remote_datasource.dart';

class CategoriesRepositoryImpl implements CategoriesRepository {
  final CategoriesRemoteDatasource _remoteDatasource;

  CategoriesRepositoryImpl({
    required CategoriesRemoteDatasource remoteDatasource,
  }) : _remoteDatasource = remoteDatasource;

  @override
  Future<Either<Failure, List<Category>>> getFiltered({
    required int pageSize,
    required int pageNumber,
    required String search,
    required bool withPaging,
  }) async {
    try {
      if (await AppNetworkUtilsImpl.instance.isConnected) {
        final result = await _remoteDatasource.getFiltered(
          pageSize: pageSize,
          pageNumber: pageNumber,
          search: search,
          withPaging: withPaging,
        );

        return Right(
          result!.toDomainList,
        );
      }

      return Left(
        NoInternetConnectionFailure(),
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
