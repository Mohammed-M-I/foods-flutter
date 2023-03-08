import 'package:flutter/material.dart';
import 'package:foods/app/core/values/export/export_values.dart';
import 'package:get/get.dart';

import '../../login_controller.dart';


class LoginHeaderView extends GetView<LoginController> {
  const LoginHeaderView({
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
