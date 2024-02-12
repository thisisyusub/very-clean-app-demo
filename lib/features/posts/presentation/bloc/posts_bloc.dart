import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:very_clean_app/features/posts/domain/entity/post_entity.dart';
import 'package:very_clean_app/features/posts/domain/repository/post_repository.dart';

part 'posts_event.dart';
part 'posts_state.dart';

class PostsBloc extends Bloc<PostsEvent, PostsState> {
  PostsBloc(this.postRepository) : super(PostsInitial()) {
    on<UserPostsRequested>(_loadPosts);
  }

  final PostRepository postRepository;

  void _loadPosts(
    UserPostsRequested event,
    Emitter<PostsState> emit,
  ) async {
    try {
      emit(PostsInProgress());

      final postsList = await postRepository.getPosts(event.userId);

      emit(PostsSuccess(postsList.posts));
    } catch (e) {
      emit(PostsFailure(e.toString()));
    }
  }
}
