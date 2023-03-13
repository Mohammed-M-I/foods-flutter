class StoreCategoriesGetFilteredResponseDto {
  final int id;
  final String name;
  final String description;
  final String image;

  StoreCategoriesGetFilteredResponseDto({
    required this.id,
    required this.name,
    required this.description,
    required this.image,
  });

  factory StoreCategoriesGetFilteredResponseDto.fromJson(
    Map<String, dynamic> json,
  ) =>
      StoreCategoriesGetFilteredResponseDto(
        id: json['id'],
        name: json['name'],
        description: json['description'],
        image: json['image'],
      );
}
