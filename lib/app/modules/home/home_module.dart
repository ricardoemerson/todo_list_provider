import 'package:provider/provider.dart';

import '../../core/modules/todo_list_module.dart';
import 'home_controller.dart';
import 'home_page.dart';

class HomeModule extends TodoListModule {
  HomeModule()
      : super(
          bindings: [
            ChangeNotifierProvider(create: (context) => HomeController()),
          ],
          routers: {
            '/home': (context) => const HomePage(),
          },
        );
}
