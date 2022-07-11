import 'package:provider/provider.dart';

import '../../core/modules/i_todo_list_module.dart';
import 'login/login_controller.dart';
import 'login/login_page.dart';
import 'register/register_controller.dart';
import 'register/register_page.dart';

class AuthModule extends ITodoListModule {
  AuthModule()
      : super(
          bindings: [
            ChangeNotifierProvider(create: (_) => LoginController()),
            ChangeNotifierProvider(
              create: (context) => RegisterController(userService: context.read()),
            ),
          ],
          routers: {
            '/login': (context) => const LoginPage(),
            '/register': (context) => const RegisterPage(),
          },
        );
}
