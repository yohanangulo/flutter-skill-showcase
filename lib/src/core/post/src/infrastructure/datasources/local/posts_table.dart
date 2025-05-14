import 'package:drift/drift.dart';
import 'package:flutter_skill_showcase/src/core/post/src/infrastructure/datasources/local/posts_db.dart';
import 'package:injectable/injectable.dart';

part 'posts_table.g.dart';

@DataClassName('PostData')
class PostsTable extends Table {
  IntColumn get id => integer()();
  TextColumn get title => text()();
  TextColumn get body => text()();
  IntColumn get userId => integer()();

  @override
  Set<Column<Object>>? get primaryKey => {id};

  @override
  String? get tableName => 'posts';
}

@lazySingleton
@DriftAccessor(tables: [PostsTable])
class PostsDao extends DatabaseAccessor<PostsDatabase> with _$PostsDaoMixin {
  PostsDao(super.db);

  Stream<List<PostData>> getAllPosts() {
    final query = select(postsTable);
    return query.watch();
  }

  Future<void> upsertPost(Insertable<PostData> posts) async {
    await into(postsTable).insertOnConflictUpdate(posts);
  }

  Future<void> deleteAllPosts() async {
    await delete(postsTable).go();
  }
}
