import 'package:dartz/dartz.dart';
import 'package:flutter_skill_showcase/src/core/post/domain.dart';
import 'package:injectable/injectable.dart';

@injectable
class GetPosts {
  GetPosts(this._postsRepository);

  final PostsRepository _postsRepository;

  Future<Either<PostsFailure, List<Post>>> call() async {
    return _postsRepository.getPosts();
  }
}
