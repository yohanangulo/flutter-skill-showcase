import 'package:drift/drift.dart';
import 'package:drift_flutter/drift_flutter.dart';
import 'package:flutter_skill_showcase/src/core/post/src/infrastructure/datasources/local/posts_table.dart';
import 'package:path_provider/path_provider.dart';

part 'posts_db.g.dart';

LazyDatabase _openConnection() {
  return LazyDatabase(() {
    return driftDatabase(
      name: 'posts_db',
      native: DriftNativeOptions(
        databaseDirectory: getApplicationSupportDirectory,
      ),
    );
  });
}

@DriftDatabase(tables: [PostsTable], daos: [PostsDao])
class PostsDatabase extends _$PostsDatabase {
  PostsDatabase() : super(_openConnection());

  @override
  int get schemaVersion => 1;
}
