
class NetworkResponse<T> {
  final bool succeeded;
  final String key;
  final String message;
  final PagedList? pagedList;
  final T? data;

  NetworkResponse({
    required this.succeeded,
    required this.key,
    required this.message,
    required this.pagedList,
    required this.data,
  });

  static NetworkResponse<T> fromJson<T>(
    Map<String, dynamic> json, [
    T Function(Map<String, dynamic> json)? fromJsonT,
  ]) =>
      NetworkResponse(
        succeeded: json['succeeded'],
        key: json['key'] ?? '',
        message: json['message'] ?? '',
        pagedList: json['pagedList'], // TODO:
        data: fromJsonT != null ? _getDataObject<T>(json, fromJsonT) : null,
      );

  static T? _getDataObject<T>(
    Map<String, dynamic> json,
    T Function(Map<String, dynamic> json) fromJsonT,
  ) {
    if (json['data'] is Map && json['data'] != null) {
      return fromJsonT(json['data']);
    }

    return null;
  }
}

class PagedList {
}

