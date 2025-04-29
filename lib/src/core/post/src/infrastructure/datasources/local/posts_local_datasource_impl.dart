import 'package:flutter_skill_showcase/src/core/post/src/domain/posts_local_datasource.dart';
import 'package:flutter_skill_showcase/src/core/post/src/infrastructure/datasources/local/posts_db.dart';
import 'package:flutter_skill_showcase/src/core/post/src/infrastructure/datasources/local/posts_table.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: PostsLocalDatasource)
class PostsLocalDatasourceImpl implements PostsLocalDatasource {
  PostsLocalDatasourceImpl(this.postsDao);

  final PostsDao postsDao;

  @override
  Stream<List<PostData>> watchAllPosts() {
    return postsDao.getAllPosts();
  }
}
