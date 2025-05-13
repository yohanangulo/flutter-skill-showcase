import 'package:flutter_skill_showcase/src/core/post/domain.dart';
import 'package:injectable/injectable.dart';

@injectable
class GetPosts {
  GetPosts(this._postsRepository);

  final PostsRepository _postsRepository;

  Stream<List<Post>> call() {
    return _postsRepository.watchAllPosts();
  }
}
