import 'package:dartz/dartz.dart';
import 'package:foods/app/core/error/export_error.dart';

import '../entities/category.dart';

abstract class CategoriesRepository {
  Future<Either<Failure, List<Category>>> getFiltered({
    required int pageSize,
    required int pageNumber,
    required String search,
    required bool withPaging,
  });
}
