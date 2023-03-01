import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'app/core/themes/app_theme.dart';
import 'app/core/values/languages/app_translation.dart';
import 'app/routes/app_pages.dart';

class App extends StatelessWidget {
  const App({
    Key? key,
  }) : super(
          key: key,
        );

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,

      // Routing
      getPages: AppPages.pages,
      initialRoute: AppRoutes.splash,

      // Theme
      theme: AppTheme.getAppTheme(),
      darkTheme: AppTheme.getAppDarkTheme(),
      themeMode: AppTheme.getAppThemeMode(),

      // Locale
      locale: AppTranslation.getAppLocale(),
      translations: AppTranslation(),
    );
  }
}
