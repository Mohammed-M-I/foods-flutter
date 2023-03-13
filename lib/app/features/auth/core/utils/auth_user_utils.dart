import 'package:foods/app/core/storage/app_storage.dart';
import 'package:foods/app/features/auth/domain/entities/login_data.dart';

abstract class AuthUserUtils {
  static Future<void> saveLoginData({
    required LoginData loginData,
  }) async {
    return AppStorage.write(
      AppStorage.loginData,
      loginData.encode(),
    );
  }

  static LoginData? get _loginData {
    final encodedData = AppStorage.read<Map<String, dynamic>?>(
      AppStorage.loginData,
      null,
    );

    if (encodedData == null) {
      return null;
    }

    return LoginData.decode(
      encodedData,
    );
  }

  static String get id => _loginData?.id ?? '';

  static String get nickName => _loginData?.nickName ?? '';

  static String get phoneNumber => _loginData?.phoneNumber ?? '';

  static String get token => _loginData?.token ?? '';
}
