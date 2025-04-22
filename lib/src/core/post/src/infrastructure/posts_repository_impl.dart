import 'package:dartz/dartz.dart';
import 'package:flutter_skill_showcase/src/config/debug/logger/app_logger.dart';
import 'package:flutter_skill_showcase/src/core/post/src/domain/post.dart';
import 'package:flutter_skill_showcase/src/core/post/src/domain/posts_failure.dart';
import 'package:flutter_skill_showcase/src/core/post/src/domain/posts_repository.dart';
import 'package:flutter_skill_showcase/src/core/post/src/domain/posts_service.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: PostsRepository)
class PostsRepositoryImpl implements PostsRepository {
  PostsRepositoryImpl(this._postsService, this._logger);

  final PostsService _postsService;
  final AppLogger _logger;

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
