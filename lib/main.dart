import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';

import 'app.dart';

Future<void> main() async {
  // Init GetStorage
  await GetStorage.init();

  runApp(
    const App(),
  );
}


