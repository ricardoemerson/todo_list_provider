import 'package:sqflite/sqlite_api.dart';

abstract class IMigration {
  void create(Batch batch);
  void update(Batch batch);
}
