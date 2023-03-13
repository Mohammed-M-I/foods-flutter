abstract class AppUrls {
  static const String baseUrl = 'http://104.238.159.155:11111/api';

  //region Accounts

  static String login() => '/api/MobAccounts/Login';

  static String register() => '/api/MobAccounts/Register';

  //endregion Accounts

//region Categories

  static String storeCategoriesGetFiltered({
    required int pageSize,
    required int pageNumber,
    required String search,
    required bool withPaging,
  }) =>
      '/api/MobStoreCategories/GetFiltered?pageSize=$pageSize&pageNumber=$pageNumber&search=$search&withPaging=$withPaging';

//endregion Categories
}
