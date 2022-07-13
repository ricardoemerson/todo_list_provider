import 'package:flutter/material.dart';

import 'core/database/sqlite_adm_connection.dart';
import 'core/navigator/todo_list_navigator.dart';
import 'core/theme/todo_list_theme_config.dart';
import 'modules/auth/auth_module.dart';
import 'modules/home/home_module.dart';
import 'modules/splash/splash_page.dart';

class AppWidget extends StatefulWidget {
  const AppWidget({Key? key}) : super(key: key);

  @override
  State<AppWidget> createState() => _AppWidgetState();
}

class _AppWidgetState extends State<AppWidget> {
  final sqliteAdmConnection = SqliteAdmConnection();

  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addObserver(sqliteAdmConnection);
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(sqliteAdmConnection);

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Todo List Provider',
      theme: TodoListThemeConfig.theme,
      home: const SplashPage(),
      navigatorKey: TodoListNavigator.navigatorKey,
      routes: {
        ...AuthModule().routers,
        ...HomeModule().routers,
      },
    );
  }
}
