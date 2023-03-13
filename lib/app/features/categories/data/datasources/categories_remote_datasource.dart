import 'package:foods/app/core/error/export_error.dart';
import 'package:foods/app/core/network/api_provider.dart';
import 'package:foods/app/core/network_response/network_response.dart';
import 'package:foods/app/core/values/export/export_values.dart';
import 'package:foods/app/features/auth/core/utils/auth_user_utils.dart';

import '../models/remote/response/store_categories_get_filtered_response_dto.dart';

abstract class CategoriesRemoteDatasource {
  Future<List<StoreCategoriesGetFilteredResponseDto>?> getFiltered({
    required int pageSize,
    required int pageNumber,
    required String search,
    required bool withPaging,
  });
}

class CategoriesRemoteDatasourceImpl implements CategoriesRemoteDatasource {
  @override
  Future<List<StoreCategoriesGetFilteredResponseDto>?> getFiltered({
    required int pageSize,
    required int pageNumber,
    required String search,
    required bool withPaging,
  }) async {
    List<StoreCategoriesGetFilteredResponseDto>? result;

    await ApiProvider.get(
      url: AppUrls.storeCategoriesGetFiltered(
        pageSize: pageSize,
        pageNumber: pageNumber,
        search: search,
        withPaging: withPaging,
      ),
      token: AuthUserUtils.token,
      onSuccess: (dynamic data) {
        final networkResponse = NetworkResponse.fromJson<StoreCategoriesGetFilteredResponseDto>(
          data,
          StoreCategoriesGetFilteredResponseDto.fromJson,
        );

        if (!networkResponse.succeeded) {
          throw ServerException(
            message: networkResponse.message,
          );
        }

        result = networkResponse.dataList ?? [];
      },
      onError: (String errorMessage) {
        throw ServerException(
          message: errorMessage,
        );
      },
    );

    return result;
  }
}
