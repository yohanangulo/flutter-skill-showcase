part of 'posts_list_bloc.dart';

enum PostsListStatus { initial, failure, success }

@freezed
abstract class PostsListState with _$PostsListState {
  factory PostsListState({
    required List<Post> posts,
    required PostsListStatus status,
    required PostsFailure? failure,
    required bool isRefreshing,
  }) = _PostsListState;

  factory PostsListState.initial() {
    return PostsListState(
      posts: [],
      status: PostsListStatus.initial,
      failure: null,
      isRefreshing: false,
    );
  }
}
