import '../../models/task_model.dart';

abstract class ITaskRepository {
  Future<void> save(DateTime date, String description);
  Future<List<TaskModel>> findByPeriod(DateTime start, DateTime end);
  Future<void> checkOrUncheckTask(TaskModel taskModel);
  Future<void> removeById(int id);
  Future<void> removeAllTasks();
}
