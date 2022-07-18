import 'package:dart_date/dart_date.dart';
import 'package:flutter/material.dart';

import '../../models/task_model.dart';
import '../../models/week_task_model.dart';
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

  @override
  Future<List<TaskModel>> getToday() =>
      _taskRepository.findByPeriod(DateTime.now(), DateTime.now());

  @override
  Future<List<TaskModel>> getTomorrow() {
    final tomorrowDate = DateTime.now().add(const Duration(days: 1));

    return _taskRepository.findByPeriod(tomorrowDate, tomorrowDate);
  }

  @override
  Future<WeekTaskModel> getWeek() async {
    final today = DateTime.now();
    var startFilter = today.startOfDay;
    DateTime endFilter;
    debugPrint('startFilter.weekday: ${startFilter.weekday}');

    if (!startFilter.isMonday) {
      startFilter = startFilter.subtract(Duration(days: startFilter.weekday - 1));
    }

    endFilter = startFilter.add(const Duration(days: 7));
    final tasks = await _taskRepository.findByPeriod(startFilter, endFilter);

    return WeekTaskModel(
      startDate: startFilter,
      endDate: endFilter,
      tasks: tasks,
    );
  }

  @override
  Future<void> checkOrUncheckTask(TaskModel taskModel) =>
      _taskRepository.checkOrUncheckTask(taskModel);

  @override
  Future<void> removeById(int id) => _taskRepository.removeById(id);

  @override
  Future<void> removeAllTasks() => _taskRepository.removeAllTasks();
}
