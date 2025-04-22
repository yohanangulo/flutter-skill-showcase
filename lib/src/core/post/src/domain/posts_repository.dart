import 'package:dartz/dartz.dart';
import 'package:flutter_skill_showcase/src/core/post/domain.dart';

abstract class PostsRepository {
  Future<Either<PostsFailure, List<Post>>> getPosts();
}
