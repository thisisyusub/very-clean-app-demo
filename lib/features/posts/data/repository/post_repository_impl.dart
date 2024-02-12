import 'package:very_clean_app/features/posts/data/data_source/post_remote_data_source.dart';
import 'package:very_clean_app/features/posts/domain/entity/post_entity.dart';
import 'package:very_clean_app/features/posts/domain/repository/post_repository.dart';

final class PostRepositoryImpl implements PostRepository {
  PostRepositoryImpl(this.postRemoteDataSource);

  final PostRemoteDataSource postRemoteDataSource;

  @override
  Future<PostListEntity> getPosts(int userId) async {
    try {
      final postsDto = await postRemoteDataSource.getPosts(userId);
      return postsDto.toEntity();
    } catch (e) {
      rethrow;
    }
  }
}
