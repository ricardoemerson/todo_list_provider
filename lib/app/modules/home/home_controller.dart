import '../../core/notifiers/default_change_notifier.dart';
import '../../data/enums/task_filter_enum.dart';
import '../../data/models/task_model.dart';
import '../../data/models/total_tasks_model.dart';
import '../../data/models/week_task_model.dart';
import '../../data/services/task/i_task_service.dart';

class HomeController extends DefaultChangeNotifier {
  final ITaskService _taskService;

  TotalTasksModel? todayTotalTasks;
  TotalTasksModel? tomorrowTotalTasks;
  TotalTasksModel? weekTotalTasks;

  var selectedFilter = TaskFilterEnum.today;

  HomeController({
    required ITaskService taskService,
  }) : _taskService = taskService;

  Future<void> loadTotalTasks() async {
    final allTasks = await Future.wait([
      _taskService.getToday(),
      _taskService.getTomorrow(),
      _taskService.getWeek(),
    ]);

    final todayTasks = allTasks[0] as List<TaskModel>;
    final tomorowTasks = allTasks[1] as List<TaskModel>;
    final weekTasks = allTasks[2] as WeekTaskModel;

    todayTotalTasks = TotalTasksModel(
      totalTasks: todayTasks.length,
      totalTasksFinish: todayTasks.where((task) => task.done).length,
    );

    tomorrowTotalTasks = TotalTasksModel(
      totalTasks: tomorowTasks.length,
      totalTasksFinish: tomorowTasks.where((task) => task.done).length,
    );

    weekTotalTasks = TotalTasksModel(
      totalTasks: weekTasks.tasks.length,
      totalTasksFinish: weekTasks.tasks.where((task) => task.done).length,
    );

    notifyListeners();
  }
}
