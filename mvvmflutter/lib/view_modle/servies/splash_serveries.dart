import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:mvvm/model/user_model.dart';
import 'package:mvvm/untils/routes/route_screen.dart';
import 'package:mvvm/view_modle/user_view_model.dart';

class SplashServices {
  Future<Usermodel> getUserData() => UserViewModel().getUser();
  void checkAuthentication(BuildContext context) async {
    getUserData().then((value) async {
      if (value.token.toString() == 'null' || value.token.toString() == '') {
        await Future.delayed(Duration(seconds: 3));
        Navigator.pushNamed(context, RoutesName.login);
      } else {
        await Future.delayed(Duration(seconds: 3));
        Navigator.pushNamed(context, RoutesName.home);
      }
    }).onError((error, stackTrace) {
      if (kDebugMode) {
        print(error.toString());
      }
    });
  }
}
