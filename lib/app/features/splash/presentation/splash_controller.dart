import 'package:foods/app/core/values/constants/app_constants.dart';
import 'package:foods/app/routes/app_pages.dart';
import 'package:get/get.dart';

class SplashController extends GetxController {
  @override
  void onInit() {
    super.onInit();

    Future.delayed(
      const Duration(
        seconds: AppConstants.splashDelay,
      ),
      () {
        Get.offNamed(
          AppRoutes.login,
        );
      },
    );
  }
}
