import 'package:dart_date/dart_date.dart';

import '../../../core/database/sqlite_connection_factory.dart';
import '../../models/task_model.dart';
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

  @override
  Future<List<TaskModel>> findByPeriod(DateTime start, DateTime end) async {
    final startFilter = start.startOfDay;
    final endFilter = end.endOfDay;

    final conn = await _sqliteConnectionFactory.openConnection();

    final result = await conn.rawQuery('''
      SELECT *
      FROM todos
      WHERE date_time BETWEEN ? AND ?
      ORDER BY date_time
    ''', [
      startFilter.toIso8601String(),
      endFilter.toIso8601String(),
    ]);

    return result.map(TaskModel.fromMap).toList();
  }

  @override
  Future<void> checkOrUncheckTask(TaskModel taskModel) async {
    final conn = await _sqliteConnectionFactory.openConnection();

    await conn.rawUpdate('''
      UPDATE todos SET
        done = ?
      WHERE id = ?
    ''', [
      taskModel.done ? 1 : 0,
      taskModel.id,
    ]);
  }

  @override
  Future<void> removeById(int id) async {
    final conn = await _sqliteConnectionFactory.openConnection();

    await conn.rawDelete('''
      DELETE FROM todos
      WHERE id = ?
    ''', [id]);
  }

  @override
  Future<void> removeAllTasks() async {
    final conn = await _sqliteConnectionFactory.openConnection();

    await conn.delete('todos');
  }
}
