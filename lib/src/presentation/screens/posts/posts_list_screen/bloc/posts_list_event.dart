part of 'posts_list_bloc.dart';

@freezed
class PostsListEvent with _$PostsListEvent {
  factory PostsListEvent.postsRequested() = PostsListRequested;
  factory PostsListEvent.postsRefreshed() = PostsListRefreshed;
  factory PostsListEvent.subscriptionRequested() =
      PostsListSubscriptionRequested;
}
