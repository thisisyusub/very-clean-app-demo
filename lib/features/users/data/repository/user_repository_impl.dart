import 'package:very_clean_app/features/users/data/data_source/user_remote_data_source.dart';
import 'package:very_clean_app/features/users/domain/entity/user_entity.dart';
import 'package:very_clean_app/features/users/domain/repository/user_repository.dart';

final class UserRepositoryImpl implements UserRepository {
  const UserRepositoryImpl();

  @override
  Future<UserListEntity> getUsers() async {
    try {
      final userRemoteDataSource = UserRemoteDataSourceImpl();
      final usersDto = await userRemoteDataSource.getUsers();
      return usersDto.toEntity();
    } catch (e) {
      rethrow;
    }
  }
}
