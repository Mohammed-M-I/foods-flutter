import 'package:flutter/material.dart';
import 'package:foods/app/core/values/app_colors.dart';
import 'package:get/get.dart';

import 'orders_controller.dart';

class OrdersPage extends GetView<OrdersController> {
  const OrdersPage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: AppColors.blue01,
      ),
    );
  }
}
