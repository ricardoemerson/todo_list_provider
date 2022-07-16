import 'package:provider/provider.dart';

import '../../core/modules/todo_list_module.dart';
import 'task_create_controller.dart';
import 'task_create_page.dart';

class TasksModule extends TodoListModule {
  TasksModule()
      : super(
          bindings: [
            ChangeNotifierProvider(
              create: (context) => TaskCreateController(),
            )
          ],
          routers: {
            '/tasks/create': (context) => TaskCreatePage(controller: context.read()),
          },
        );
}
