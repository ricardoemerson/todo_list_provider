import '../../repositories/task/i_task_repository.dart';
import 'i_task_service.dart';

class TaskService implements ITaskService {
  final ITaskRepository _taskRepository;

  TaskService({
    required ITaskRepository taskRepository,
  }) : _taskRepository = taskRepository;

  @override
  Future<void> save(DateTime date, String description) =>
      _taskRepository.save(date, description);
}
