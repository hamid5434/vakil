part of 'auth_bloc.dart';

abstract class AuthState extends Equatable {
  final bool isSave;
  const AuthState(this.isSave);
  @override
  List<Object> get props => [isSave];
}

class AuthInitial extends AuthState {
  AuthInitial(bool isSave) : super(isSave);

}

class AuthLoading extends AuthState {
  AuthLoading(bool isSave) : super(isSave);
}

class AuthLoaded extends AuthState {
  AuthLoaded(bool isSave) : super(isSave);
}

class AuthError extends AuthState {
  final AppException exception;

  AuthError({required bool isSave, required this.exception}): super(isSave);

  @override
  List<Object> get props => [exception];
}
