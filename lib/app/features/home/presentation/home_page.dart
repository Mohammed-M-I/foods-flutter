import 'package:flutter/material.dart';
import 'package:foods/app/features/home/presentation/home_controller.dart';
import 'package:get/get.dart';

import '../../../core/values/app_dimensions.dart';
import '../../../global_widgets/app_progress_widget.dart';

class HomePage extends GetView<HomeController> {
  const HomePage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Obx(
          () => controller.state().isLoading
              ? const Center(
                  child: AppProgressWidget(),
                )
              : ListView.builder(
                  itemCount: controller.state().categories.length,
                  itemBuilder: (BuildContext context, int index) {
                    final category = controller.state().categories[index];

                    return Container(
                      padding: const EdgeInsets.all(
                        AppDimensions.paddingOrMargin16,
                      ),
                      child: Text(
                        category.name,
                      ),
                    );
                  },
                ),
        ),
      ),
    );
  }
}
