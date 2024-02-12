import 'dart:convert';

import 'package:http/http.dart';
import 'package:very_clean_app/features/posts/data/dto/post_dto.dart';

abstract interface class PostRemoteDataSource {
  Future<PostListDto> getPosts(int userId);
}

final class PostRemoteDataSourceImpl implements PostRemoteDataSource {
  const PostRemoteDataSourceImpl(this.client);

  final Client client;

  @override
  Future<PostListDto> getPosts(int userId) async {
    final response = await client.get(
      Uri.parse(
        'https://jsonplaceholder.typicode.com/posts?userId=$userId',
      ),
    );

    if (response.statusCode == 200) {
      final encodedBody = jsonDecode(response.body) as List<dynamic>;
      return PostListDto.fromJson(encodedBody);
    } else {
      throw Exception('Something went wrong!');
    }
  }
}
