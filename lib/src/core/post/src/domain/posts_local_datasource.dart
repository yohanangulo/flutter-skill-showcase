import 'package:flutter_skill_showcase/src/core/post/src/infrastructure/datasources/local/posts_db.dart';

abstract class PostsLocalDatasource {
  Stream<List<PostData>> watchAllPosts();
}
