import 'package:dartz/dartz.dart';
import 'package:flutter_skill_showcase/src/config/debug/logger/app_logger.dart';
import 'package:flutter_skill_showcase/src/core/post/src/domain/post.dart';
import 'package:flutter_skill_showcase/src/core/post/src/domain/posts_failure.dart';
import 'package:flutter_skill_showcase/src/core/post/src/domain/posts_local_datasource.dart';
import 'package:flutter_skill_showcase/src/core/post/src/domain/posts_repository.dart';
import 'package:flutter_skill_showcase/src/core/post/src/domain/posts_remote_datasource.dart';
import 'package:injectable/injectable.dart';
import 'package:rxdart/rxdart.dart';

@LazySingleton(as: PostsRepository)
class PostsRepositoryImpl implements PostsRepository {
  PostsRepositoryImpl(
    this._postsService,
    this._postsLocalDatasource,
    this._logger,
  );

  final PostsRemoteDatasource _postsService;
  final PostsLocalDatasource _postsLocalDatasource;
  final AppLogger _logger;

  Stream<List<Post>> watchAllPosts() {
    return _postsLocalDatasource.watchAllPosts().switchMap((post) {
      return Stream.value(
        post.map((e) {
          return Post(userId: e.userId, id: e.id, title: e.title, body: e.body);
        }).toList(),
      );
    });
  }

  @override
  Future<Either<PostsFailure, List<Post>>> getPosts() async {
    try {
      final posts = await _postsService.getPosts();

      return right(posts.map((e) => e.toDomain()).toList());
    } catch (e, s) {
      _logger.e('Error getting posts', error: e, stackTrace: s);

      return left(PostsFailure.serverError());
    }
  }
}
