import 'package:flutter/material.dart';

import '../../core/notifiers/default_change_notifier.dart';
import '../../data/services/task/i_task_service.dart';

class TaskCreateController extends DefaultChangeNotifier {
  final ITaskService _taskService;
  DateTime? _selectedDate;

  TaskCreateController({
    required ITaskService taskService,
  }) : _taskService = taskService;

  set selectedDate(DateTime? selectedDate) {
    resetState();

    _selectedDate = selectedDate;

    notifyListeners();
  }

  DateTime? get selectedDate => _selectedDate;

  Future<void> save(String description) async {
    try {
      showLoadingAndResetState();
      notifyListeners();

      if (_selectedDate != null) {
        await _taskService.save(_selectedDate!, description);
        success();
      } else {
        setError('Data da tarefa não selecionada!');
      }
    } catch (err, stk) {
      debugPrint('err: $err');
      debugPrint('stk: $stk');

      setError('Erro ao cadastrar tarefa!');
    } finally {
      hideLoading();
      notifyListeners();
    }
  }
}
