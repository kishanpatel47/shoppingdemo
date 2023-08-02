import 'package:encrypt/encrypt.dart' as encrypt;
import 'package:http/http.dart' as https;

class EcncyptService {
  static final EcncyptService _ecncyptService = EcncyptService._internal();
  final key = encrypt.Key.fromUtf8('Z4NMqZEvvScXIxwk');
  final iv = encrypt.IV.fromUtf8('vg96EmbXrpPSICat');
  factory EcncyptService() {
    return _ecncyptService;
  }
  EcncyptService._internal();
  String encryptMyData(String text) {
    final e = encrypt.Encrypter(encrypt.AES(key, mode: encrypt.AESMode.cbc));
    // ignore: non_constant_identifier_names
    final encrypted_data = e.encrypt(text, iv: iv);
    return encrypted_data.base64;
  }

  String decryptMyData(String text) {
    final e = encrypt.Encrypter(encrypt.AES(key, mode: encrypt.AESMode.cbc));
    // ignore: non_constant_identifier_names
    final decrypted_data =
        e.decrypt(encrypt.Encrypted.fromBase64(text), iv: iv);
    return decrypted_data;
  }

  jsonReqToken(String string) {
    int str2 = ((string.length / 2) - 1).toInt();
    int str3 = (str2 > 10) ? 10 : str2;
    var res = string.substring(str2, str3);
    // str3 = str3.toInt();
    // final res = string.substring(str2);
    // final token = res.substring(0, str3);
    // var beforeToken = string.substring(0, str2);
    // var afterToken = string.substring(str2 + str3);
    // var obj = {"req": beforeToken + afterToken, "token": token.toString()};
    // return obj;
  }
}
