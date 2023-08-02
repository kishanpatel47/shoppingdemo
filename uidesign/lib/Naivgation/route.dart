import 'package:flutter/material.dart';
import 'package:uidesign/Naivgation/route_screen.dart';
import 'package:uidesign/Screen/Login.dart';
import 'package:uidesign/Screen/Registerscreen.dart';

class Routes {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case RouteScreen.Loginscreen:
        return MaterialPageRoute(builder: (Ctx) => Login());
      case RouteScreen.Registerscreen:
        return MaterialPageRoute(builder: (Ctx) => Registerscreen());
      default:
        return MaterialPageRoute(
            builder: (ctx) => Card(
                  child: Container(
                    height: 250,
                    width: 250,
                    child: Center(
                      child: Text(' No page Route'),
                    ),
                  ),
                ));
    }
  }
}
