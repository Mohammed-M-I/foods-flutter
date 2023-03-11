import 'package:foods/app/features/home/presentation/home_binding.dart';
import 'package:foods/app/features/orders/presentation/orders_binding.dart';
import 'package:foods/app/features/profile/presentation/profile_binding.dart';

import '../features/auth/presentation/login/login_binding.dart';
import '../features/auth/presentation/login/login_page.dart';
import '../features/main/presentation/main_binding.dart';
import '../features/main/presentation/main_page.dart';
import '../features/splash/presentation/splash_binding.dart';
import '../features/splash/presentation/splash_page.dart';
import 'package:get/get.dart';

import '../features/auth/presentation/register/register_page.dart';
import '../features/auth/presentation/register/regsiter_binding.dart';

part 'app_routes.dart';

abstract class AppPages {
  static final List<GetPage> pages = [
    // Splash
    GetPage(
      name: AppRoutes.splash,
      page: () => const SplashPage(),
      binding: SplashBinding(),
      transition: Transition.fadeIn,
    ),

    // Auth
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

    // Main
    GetPage(
      name: AppRoutes.main,
      page: () => const MainPage(),
      bindings: [
        MainBinding(),
        HomeBinding(),
        OrdersBinding(),
        ProfileBinding(),
      ],
      transition: Transition.fadeIn,
    ),
  ];
}
