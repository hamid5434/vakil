
import 'package:vakil_0098/common/app_urls.dart';
import 'package:vakil_0098/data/service/service.dart';
import 'package:vakil_0098/models/auth/user_model.dart';

abstract class IAuthDataSource {
  Future<UserModel> login({required String username, required String password});
}

class AuthDataSource implements IAuthDataSource {
  final IService service;

  AuthDataSource({required this.service});

  @override
  Future<UserModel> login(
      {required String username, required String password}) async {
    String url = AppUrls.auth;
    var result = await service.post(
        url: url,
        body: {"email": username, "password": password});

    var auth = UserModel.fromJson(result);

    return auth;
  }

}
