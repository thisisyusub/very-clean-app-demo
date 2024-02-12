import 'package:very_clean_app/features/users/domain/entity/user_entity.dart';

abstract class UserRepository {
  Future<UserListEntity> getUsers();
}
