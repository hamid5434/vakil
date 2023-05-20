import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import 'package:vakil_0098/common/exceptions.dart';
import 'package:vakil_0098/common/token.dart';
import 'package:vakil_0098/data/repository/auth/auth_repository.dart';

part 'auth_event.dart';

part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final IAuthRepository repository;
  bool isSave;

  AuthBloc({
    required this.repository,
    this.isSave = false,
  }) : super(AuthInitial(isSave)) {
    on<AuthEvent>((event, emit) async {
      if (event is AuthButtonIsClicked) {
        emit(AuthLoading(isSave));
        //await Future.delayed(const Duration(seconds: 2));
        try {
          var result = await repository.login(
              username: event.username, password: event.password);
          if (isSave) {
            await Token.savedUser(
                username: event.username, password: event.password);
            await Token.setToken(resultToken: result.accessToken!);
          } else {
            Token.resultToken = result.user![0];
            await Token.reomveUserSaved();
          }
          emit(AuthLoaded(isSave));
        } catch (ex) {
          emit(
            AuthError(
              isSave: isSave,
              exception: ex is AppException
                  ? ex
                  : AppException(
                      message: ex.toString(),
                      statusCode: 1,
                    ),
            ),
          );
        }
      } else if (event is AuthIsSave) {
        isSave = !isSave;
        emit(AuthInitial(isSave));
      }
    });
  }
}
