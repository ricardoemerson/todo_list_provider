import 'package:sqflite/sqflite.dart';

import './i_migration.dart';

class MigrationV2 implements IMigration {
  @override
  void create(Batch batch) {
    batch.execute('''
      CREATE TABLE teste (
        id INTEGER
      )
    ''');
  }

  @override
  void upgrade(Batch batch) {
    batch.execute('''
      CREATE TABLE teste (
        id INTEGER
      )
    ''');
  }
}
