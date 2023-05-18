import 'package:shared_preferences/shared_preferences.dart';

import 'encrypt.dart';


class Token {
  //static AuthModel? resultToken;

  static Future<String> setToken({required String resultToken}) async {
    //Token.resultToken = resultToken;
    SharedPreferences prefs = await SharedPreferences.getInstance();
    //await prefs.setString("token", resultToken.token);
    await prefs.setString("token", resultToken);
    return resultToken;
  }

  static Future<bool> setFirebaseToken({String firebaseToken = ""}) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    await prefs.setString("firebaseToken", firebaseToken);
    return true;
  }

  static Future<bool> savedUser(
      {required String username, required String password}) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    username = Encrypt.encryptText(text: username);
    password = Encrypt.encryptText(text: password);

    await prefs.setString("username", username);
    await prefs.setString("password", password);
    return true;
  }

  static Future<bool> setlocaleApp({required String localeName}) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString("localeName", localeName);
    localeNameMain = localeName;
    return true;
  }

  static String? localeNameMain = 'en';
  static Future<String?> getlocaleApp() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    localeNameMain = await prefs.getString("localeName");
    return localeNameMain;
  }

  static String themeType = 'light';
  static Future<String> getTheme() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    themeType = await prefs.getString("themeType") ?? 'light';
    return themeType;
  }

  static Future<bool> setTheme({required String themeType }) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString("themeType", themeType);
    return true;
  }

}
