import 'package:flutter_skill_showcase/src/core/post/src/infrastructure/datasources/local/posts_db.dart';
import 'package:injectable/injectable.dart';

@module
abstract class DatabaseModule {
  @lazySingleton
  PostsDatabase get postsDatabase => PostsDatabase();
}
