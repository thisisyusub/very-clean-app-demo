import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:very_clean_app/features/users/data/repository/user_repository_impl.dart';
import 'package:very_clean_app/features/users/domain/entity/user_entity.dart';

part 'users_event.dart';
part 'users_state.dart';

class UsersBloc extends Bloc<UsersEvent, UsersState> {
  UsersBloc() : super(UsersInitial()) {
    on<UsersDataRequested>(_loadUsers);
  }

  void _loadUsers(
    UsersDataRequested event,
    Emitter<UsersState> emit,
  ) async {
    try {
      emit(UsersInProgress());

      const userRepository = UserRepositoryImpl();
      final usersList = await userRepository.getUsers();

      emit(UsersSuccess(usersList.users));
    } catch (e) {
      emit(UsersFailure(e.toString()));
    }
  }
}
