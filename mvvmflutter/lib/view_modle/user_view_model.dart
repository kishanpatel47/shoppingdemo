import 'package:flutter/widgets.dart';
import 'package:mvvm/model/user_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UserViewModel with ChangeNotifier {
  Future<bool> saveUser(Usermodel usermodel) async {
    final SharedPreferences sp = await SharedPreferences.getInstance();
    sp.setString('token', usermodel.token.toString());
    notifyListeners();
    return true;
  }

  Future<Usermodel> getUser() async {
    final SharedPreferences sp = await SharedPreferences.getInstance();
    String? token = sp.getString('token');
    return Usermodel(token: token.toString());
  }

  Future<bool> remove() async {
    final SharedPreferences sp = await SharedPreferences.getInstance();
    sp.remove('token');
    return true;
  }
}
