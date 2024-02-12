import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:very_clean_app/features/users/data/dto/user_dto.dart';

abstract interface class UserRemoteDataSource {
  Future<UserListDto> getUsers();
}

final class UserRemoteDataSourceImpl implements UserRemoteDataSource {
  @override
  Future<UserListDto> getUsers() async {
    final response = await http.get(
      Uri.parse('https://jsonplaceholder.typicode.com/users'),
    );

    if (response.statusCode == 200) {
      final encodedBody = jsonDecode(response.body) as List<dynamic>;
      return UserListDto.fromJson(encodedBody);
    } else {
      throw Exception('Something went wrong!');
    }
  }
}
