part of 'auth_bloc.dart';

abstract class AuthEvent extends Equatable {
  const AuthEvent();
}

class AuthInitialEvent extends AuthEvent {
  const AuthInitialEvent();

  @override
  List<Object?> get props => [];
}

class AuthIsSave extends AuthEvent {
  const AuthIsSave();

  @override
  List<Object?> get props => [];
}

class AuthButtonIsClicked extends AuthEvent {
  final String username;
  final String password;

  const AuthButtonIsClicked({
    required this.username,
    required this.password,
  });

  @override
  List<Object?> get props => [
        username,
        password,
      ];
}
