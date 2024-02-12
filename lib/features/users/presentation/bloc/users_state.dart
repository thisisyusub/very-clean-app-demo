part of 'users_bloc.dart';

sealed class UsersState {
  const UsersState();
}

class UsersInitial extends UsersState {}

class UsersInProgress extends UsersState {}

class UsersFailure extends UsersState {
  const UsersFailure(this.message);

  final String message;
}

class UsersSuccess extends UsersState {
  const UsersSuccess(this.users);

  final List<UserEntity> users;
}
