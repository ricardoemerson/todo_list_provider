abstract class ITaskRepository {
  Future<void> save(DateTime date, String description);
}
