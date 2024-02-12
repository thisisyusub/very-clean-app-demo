part of 'posts_bloc.dart';

sealed class PostsState {
  const PostsState();
}

class PostsInitial extends PostsState {}

class PostsInProgress extends PostsState {}

class PostsFailure extends PostsState {
  const PostsFailure(this.message);

  final String message;
}

class PostsSuccess extends PostsState {
  const PostsSuccess(this.posts);

  final List<PostEntity> posts;
}
