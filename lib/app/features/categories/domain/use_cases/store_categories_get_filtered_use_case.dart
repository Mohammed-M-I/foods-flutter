import 'package:dartz/dartz.dart';
import 'package:foods/app/core/error/export_error.dart';
import 'package:foods/app/core/use_case/use_case.dart';

import '../entities/category.dart';
import '../repositories/categories_repository.dart';

class StoreCategoriesGetFilteredUseCase extends UseCase<List<Category>, Params> {
  final CategoriesRepository _repository;

  StoreCategoriesGetFilteredUseCase({
    required CategoriesRepository repository,
  }) : _repository = repository;

  @override
  Future<Either<Failure, List<Category>>> call(Params params) {
    return _repository.getFiltered(
      pageSize: params.pageSize,
      pageNumber: params.pageNumber,
      search: params.search,
      withPaging: params.withPaging,
    );
  }
}

class Params {
  final int pageSize;
  final int pageNumber;
  final String search;
  final bool withPaging;

  Params({
    required this.pageSize,
    required this.pageNumber,
    required this.search,
    required this.withPaging,
  });
}
