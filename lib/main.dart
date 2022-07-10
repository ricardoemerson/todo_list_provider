import 'package:flutter/material.dart';
import 'package:wakelock/wakelock.dart';

import 'app/app_module.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  Wakelock.enable();

  runApp(const AppModule());
}
