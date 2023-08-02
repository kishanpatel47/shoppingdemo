import 'package:flutter/material.dart';
import 'package:mvvm/untils/routes/route_screen.dart';
import 'package:mvvm/view/Splash_view.dart';
import 'package:mvvm/view/home_screen.dart';
import 'package:mvvm/view/login_screen.dart';
import 'package:mvvm/view/register_view.dart';

class Routes {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case RoutesName.home:
        return MaterialPageRoute(builder: (context) => Homescreen());
      case RoutesName.login:
        return MaterialPageRoute(builder: (context) => loginscreen());
      case RoutesName.register:
        return MaterialPageRoute(builder: (context) => register_view());
      case RoutesName.splashscreen:
        return MaterialPageRoute(builder: (context) => SplashView());

      default:
        return MaterialPageRoute(builder: (_) {
          return Scaffold(
            body: Center(
              child: Text('No Page Route'),
            ),
          );
        });
    }
  }
}
