import '../../../data/models/remote/response/store_categories_get_filtered_response_dto.dart';
import '../category.dart';

extension StoreCategoriesGetFilteredResponseDtoExtensions on StoreCategoriesGetFilteredResponseDto {
  Category get toDomain => Category(
        id: id,
        name: name,
        description: description,
        image: image,
      );
}

extension ListStoreCategoriesGetFilteredResponseDtoExtensions on List<StoreCategoriesGetFilteredResponseDto> {
  List<Category> get toDomainList => map(
        (element) => element.toDomain,
      ).toList();
}
