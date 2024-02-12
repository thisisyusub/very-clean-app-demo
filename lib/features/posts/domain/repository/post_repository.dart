import 'package:very_clean_app/features/posts/domain/entity/post_entity.dart';

abstract interface class PostRepository {
  Future<PostListEntity> getPosts(int userId);
}
