

import 'package:vakil_0098/data/service/service.dart';
import 'package:vakil_0098/data/source/auth/auth_data_source.dart';
import 'package:vakil_0098/models/auth/user_model.dart';

final authRepository = AuthRepository(
  dataSource: AuthDataSource(
    service: Service(),
  ),
);

abstract class IAuthRepository {
  Future<UserModel> login({required String username, required String password});
}

class AuthRepository implements IAuthRepository {
  final IAuthDataSource dataSource;

  AuthRepository({required this.dataSource});

  @override
  Future<UserModel> login(
      {required String username, required String password}) async {
    UserModel result =
        await dataSource.login(username: username, password: password);
    return result;
  }
}
