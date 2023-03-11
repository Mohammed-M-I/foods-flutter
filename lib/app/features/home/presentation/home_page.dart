import 'package:flutter/material.dart';
import 'package:foods/app/core/values/app_colors.dart';
import 'package:foods/app/features/home/presentation/home_controller.dart';
import 'package:get/get.dart';

class HomePage extends GetView<HomeController> {
  const HomePage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: AppColors.primary,
      ),
    );
  }
}
