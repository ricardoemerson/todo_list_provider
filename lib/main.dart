import 'package:flutter/material.dart';
import 'package:todo_list_provider/app/app_module.dart';
import 'package:wakelock/wakelock.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  Wakelock.enable();

  runApp(const AppModule());
}
