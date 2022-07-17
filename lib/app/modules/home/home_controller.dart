import '../../core/notifiers/default_change_notifier.dart';
import '../../data/enums/task_filter_enum.dart';

class HomeController extends DefaultChangeNotifier {
  var selectedFilter = TaskFilterEnum.today;
}
