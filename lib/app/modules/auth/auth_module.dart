import 'package:provider/provider.dart';

import '../../core/modules/i_todo_list_module.dart';
import 'login/login_controller.dart';
import 'login/login_page.dart';

class AuthModule extends ITodoListModule {
  AuthModule()
      : super(
          bindings: [
            ChangeNotifierProvider(create: (_) => LoginController()),
          ],
          routers: {
            '/login': (context) => const LoginPage(),
          },
        );
}
