import 'package:foods/app/features/auth/presentation/login/login_binding.dart';
import 'package:foods/app/features/auth/presentation/login/login_page.dart';
import 'package:foods/app/features/splash/presentation/splash_binding.dart';
import 'package:foods/app/features/splash/presentation/splash_page.dart';
import 'package:get/get.dart';

import '../features/auth/presentation/register/register_page.dart';
import '../features/auth/presentation/register/regsiter_binding.dart';

part 'app_routes.dart';

abstract class AppPages {
  static final List<GetPage> pages = [
    GetPage(
      name: AppRoutes.splash,
      page: () => const SplashPage(),
      binding: SplashBinding(),
      transition: Transition.fadeIn,
    ),
    GetPage(
      name: AppRoutes.login,
      page: () => const LoginPage(),
      binding: LoginBinding(),
      transition: Transition.fadeIn,
    ),
    GetPage(
      name: AppRoutes.register,
      page: () => const RegisterPage(),
      binding: RegisterBinding(),
      transition: Transition.fadeIn,
    ),
  ];
}
