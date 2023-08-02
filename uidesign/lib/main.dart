import 'package:flutter/material.dart';
import 'package:uidesign/Naivgation/route.dart';
import 'package:uidesign/Naivgation/route_screen.dart';

void main() {
  runApp(AndroidMenifest());
}

class AndroidMenifest extends StatefulWidget {
  const AndroidMenifest({Key? key}) : super(key: key);

  @override
  State<AndroidMenifest> createState() => _AndroidMenifestState();
}

class _AndroidMenifestState extends State<AndroidMenifest> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: RouteScreen.Loginscreen,
      onGenerateRoute: Routes.generateRoute,
    );
  }
}
