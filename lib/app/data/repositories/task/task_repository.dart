import '../../../core/database/sqlite_connection_factory.dart';
import 'i_task_repository.dart';

class TaskRepository implements ITaskRepository {
  final SqliteConnectionFactory _sqliteConnectionFactory;

  TaskRepository({
    required SqliteConnectionFactory sqliteConnectionFactory,
  }) : _sqliteConnectionFactory = sqliteConnectionFactory;

  @override
  Future<void> save(DateTime date, String description) async {
    final conn = await _sqliteConnectionFactory.openConnection();

    await conn.insert('todos', {
      'id': null,
      'description': description,
      'date_time': date.toIso8601String(),
      'done': 0,
    });
  }
}
