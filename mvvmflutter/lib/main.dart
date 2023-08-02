import 'package:flutter/material.dart';
import 'package:mvvm/untils/routes/route_screen.dart';
import 'package:mvvm/untils/routes/routes.dart';
import 'package:mvvm/view/home_screen.dart';
import 'package:mvvm/view_modle/auth_view_model.dart';
import 'package:mvvm/view_modle/user_view_model.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MaterialApp(
    home: Route(),
  ));
}

class Route extends StatefulWidget {
  const Route({super.key});

  @override
  State<Route> createState() => _RouteState();
}

class _RouteState extends State<Route> {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => AuthViewModel(),
        ),
        ChangeNotifierProvider(
          create: (context) => UserViewModel(),
        )
      ],
      child: MaterialApp(
        title: 'flutter Demo',
        theme: ThemeData(primarySwatch: Colors.amber),
        initialRoute: RoutesName.splashscreen,
        onGenerateRoute: Routes.generateRoute,
      ),
    );
  }
}
