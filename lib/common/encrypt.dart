import 'package:encrypt/encrypt.dart' as encrypt;

class Encrypt {
  static final key = encrypt.Key.fromLength(32);
  static final iv = encrypt.IV.fromLength(16);
  static final encrypter = encrypt.Encrypter(encrypt.AES(key));

  static String encryptText({required text}) {
    final encrypted = encrypter.encrypt(text, iv: iv);
    return encrypted.base64;
  }

  static String decryptedText({required text}) {
    encrypt.IV temp = encrypt.IV.fromBase64(text);
    final decrypted = encrypter.decrypt(temp, iv: iv);
    print(decrypted);
    return decrypted;
  }
}