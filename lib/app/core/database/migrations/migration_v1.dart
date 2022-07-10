import 'package:sqflite/sqflite.dart';

import 'i_migration.dart';

class MigrationV1 implements IMigration {
  @override
  void create(Batch batch) {
    batch.execute('''
      CREATE TABLE todos (
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        description VARCHAR(500) NOT NULL,
        date_time DATETIME,
        done INTEGER
      )
    ''');
  }

  @override
  void upgrade(Batch batch) {}
}
