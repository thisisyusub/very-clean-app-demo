part of 'posts_bloc.dart';

sealed class PostsEvent {
  const PostsEvent();
}

class UserPostsRequested extends PostsEvent {
  const UserPostsRequested(this.userId);

  final int userId;
}
