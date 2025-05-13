import 'package:flutter_skill_showcase/src/core/post/domain.dart';
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

  @override
  Future<void> savePosts(List<Post> posts) async {
    final postsData = posts.map((e) {
      return PostData(
        id: e.id,
        title: e.title,
        body: e.body,
        userId: e.userId,
      );
    }).toList();

    for (var post in postsData) {
      await postsDao.upsertPost(post);
    }
  }

  @override
  Future<void> deleteAllPosts() async {
    await postsDao.deleteAllPosts();
  }
}
