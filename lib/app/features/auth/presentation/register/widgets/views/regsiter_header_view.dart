import 'package:flutter/material.dart';
import 'package:foods/app/core/values/export/export_values.dart';
import 'package:foods/app/global_widgets/export/export_global_widgets.dart';
import 'package:get/get.dart';

import '../../register_controller.dart';

class RegisterHeaderView extends GetView<RegisterController> {
  const RegisterHeaderView({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: AppDimensions.paddingOrMargin100,
        vertical: AppDimensions.paddingOrMargin40,
      ),
      child: Image.asset(
        AppAssets.logo,
      ),
    );
  }
}
