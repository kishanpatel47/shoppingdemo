import 'package:flutter/material.dart';
import 'package:suvidha_sarathi/Navigationscreen/route_screen.dart';
import 'package:suvidha_sarathi/Screen/Dashbord.dart';
import 'package:suvidha_sarathi/Screen/Login.dart';
import 'package:suvidha_sarathi/Screen/Registerscreen.dart';
import 'package:suvidha_sarathi/Screen/Splashscreen.dart';

class Routes {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case RouteScreen.Splash:
        return MaterialPageRoute(builder: (_) => const Splash());
      case RouteScreen.Login:
        return MaterialPageRoute(builder: (_) => const Login());
      case RouteScreen.Registerscreen:
        return MaterialPageRoute(builder: (_) => const NewRegister());
      case RouteScreen.Dashboard:
        return MaterialPageRoute(builder: (_) => const Dashboard());

      default:
        return MaterialPageRoute(
            builder: (_) => const Center(
                  child: Text('No Page  in Route'),
                ));
    }
  }
}
