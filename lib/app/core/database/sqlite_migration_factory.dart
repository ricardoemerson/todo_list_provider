import 'migrations/migration_v1.dart';

class SqliteMigrationFactory {
  List<MigrationV1> getCreateMigration() => [
        MigrationV1(),
      ];

  List<MigrationV1> getUpgradeMigration(int version) => [];
}
