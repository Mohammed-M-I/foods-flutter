import 'package:flutter/material.dart';

import '../core/values/app_colors.dart';

class AppProgressWidget extends StatelessWidget {
  const AppProgressWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const CircularProgressIndicator(
      color: AppColors.primary,
    );
  }
}
