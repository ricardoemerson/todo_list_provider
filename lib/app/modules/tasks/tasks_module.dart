import 'package:provider/provider.dart';

import '../../core/modules/todo_list_module.dart';
import '../../data/repositories/task/i_task_repository.dart';
import '../../data/repositories/task/task_repository.dart';
import '../../data/services/task/i_task_service.dart';
import '../../data/services/task/task_service.dart';
import 'task_create_controller.dart';
import 'task_create_page.dart';

class TasksModule extends TodoListModule {
  TasksModule()
      : super(
          bindings: [
            Provider<ITaskRepository>(
              create: (context) =>
                  TaskRepository(sqliteConnectionFactory: context.read()),
            ),
            Provider<ITaskService>(
              create: (context) => TaskService(taskRepository: context.read()),
            ),
            ChangeNotifierProvider(
              create: (context) => TaskCreateController(taskService: context.read()),
            )
          ],
          routers: {
            '/tasks/create': (context) => TaskCreatePage(controller: context.read()),
          },
        );
}
