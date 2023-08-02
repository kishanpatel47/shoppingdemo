import 'package:another_flushbar/flushbar.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:mvvm/model/user_model.dart';
import 'package:mvvm/repositry/auth_repository.dart';
import 'package:mvvm/untils/routes/route_screen.dart';
import 'package:mvvm/view_modle/user_view_model.dart';
import 'package:provider/provider.dart';

class AuthViewModel with ChangeNotifier {
  final _myRepo = AuthRepositry();
  bool _loading = false;
  bool get loading => _loading;
  setLoading(bool value) {
    _loading = value;
    notifyListeners();
  }

  Future<void> loginApi(dynamic data, BuildContext context) async {
    setLoading(true);
    _myRepo.loginApi(data).then((value) {
      setLoading(false);
      Fluttertoast.showToast(msg: 'Login');
      final userpreference = Provider.of<UserViewModel>(context, listen: false);
      userpreference.saveUser(Usermodel(token: value['token'].toString()));
      Navigator.pushNamed(context, RoutesName.home);
      print(value.toString());
    }).onError((error, stackTrace) {
      Fluttertoast.showToast(msg: error.toString());
      setLoading(false);
      print(error.toString());
    });
  }

  Future<void> registerApi(dynamic data, BuildContext context) async {
    setLoading(true);
    _myRepo.registerApi(data).then((value) {
      setLoading(false);
      Fluttertoast.showToast(msg: 'register');
      Navigator.pushNamed(context, RoutesName.login);
      print(value.toString());
    }).onError((error, stackTrace) {
      Fluttertoast.showToast(msg: error.toString());
      setLoading(false);
      print(error.toString());
    });
  }
}
