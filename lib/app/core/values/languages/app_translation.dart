import 'dart:ui';

import 'package:get/get.dart';

import '../../storage/app_storage.dart';
import 'from/ar_sa_translations.dart';
import 'from/en_us_translations.dart';

class AppTranslation extends Translations {
  //region Languages Keys

  static const String arabicLang = 'ar';
  static const String arabicCountry = 'SA';
  static const String arabicLocale = '${arabicLang}_$arabicCountry'; // 'ar_SA'

  static const String englishLang = 'en';
  static const String englishCountry = 'US';
  static const String englishLocale = '${englishLang}_$englishCountry'; // 'en_US'

  //endregion

  @override
  Map<String, Map<String, String>> get keys => {
        arabicLocale: arSA,
        englishLocale: enUS,
      };

  static Locale getAppLocale() {
    final String lang = AppStorage.read(
      AppStorage.locale,
      englishLocale,
    );

    return getLocale(lang);
  }

  static Future changeLocale(
    String locale,
  ) async {
    await AppStorage.write(
      AppStorage.locale,
      locale,
    );

    // For Settings Switch
    if (locale.split('_').first == arabicLang) {
      await AppStorage.write(
        AppStorage.isRTL,
        true,
      );
    } else {
      await AppStorage.write(
        AppStorage.isRTL,
        false,
      );
    }

    Get.updateLocale(
      getLocale(
        locale,
      ),
    );
  }

  // Utils
  static Locale getLocale(String locale) {
    return Locale.fromSubtags(
      scriptCode: '_',
      languageCode: locale.split('_').first,
      countryCode: locale.split('_').last,
    );
  }
}
