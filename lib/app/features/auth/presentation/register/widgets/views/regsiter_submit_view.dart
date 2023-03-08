import 'package:flutter/material.dart';
import 'package:foods/app/core/values/export/export_values.dart';
import 'package:foods/app/global_widgets/export/export_global_widgets.dart';
import 'package:get/get.dart';

import '../../register_controller.dart';
import '../../ui/register_ui_event.dart';

class RegisterSubmitView extends GetView<RegisterController> {
  const RegisterSubmitView({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => controller.state().isLoading
          ? const AppProgressWidget()
          : IntrinsicWidth(
              stepWidth: double.infinity,
              child: AppButtonWidget(
                text: AppStrings.register.tr,
                onPressed: () {
                  controller.on(
                    event: RegisterUiEvent.register(
                      nickName: controller.state().nickNameController.text,
                      phoneNumber: controller.state().phoneNumberController.text,
                      password: controller.state().passwordController.text,
                    ),
                  );
                },
              ),
            ),
    );
  }
}
