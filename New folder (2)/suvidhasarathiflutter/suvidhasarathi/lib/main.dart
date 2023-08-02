import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:responsive_framework/responsive_framework.dart';
//
import 'package:suvidhasarathi/Navigationscreen/Routes.dart';
import 'package:suvidhasarathi/Navigationscreen/route_screen.dart';
// import 'package:suvidha_sarathi/helpers/register_web_webview_stub.dart'
import 'package:suvidhasarathi/helpers/register_web_webview_stub.dart';
    // if (dart.library.html)'package:suvidhasarathi/helpers/register_web_webview.dart';
    if(dart.)

void main() {
  SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);
  registerWebViewWebImpementation();
  runApp(AndroidRoute());
}

class AndroidRoute extends StatefulWidget {
  const AndroidRoute({Key? key}) : super(key: key);

  @override
  State<AndroidRoute> createState() => _AndroidRouteState();
}

class _AndroidRouteState extends State<AndroidRoute> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      builder: (context, widget) => ResponsiveWrapper.builder(
        ClampingScrollWrapper.builder(context, widget!),
        breakpoints: [
          ResponsiveBreakpoint.resize(350, name: MOBILE),
          ResponsiveBreakpoint.autoScale(600, name: TABLET),
          ResponsiveBreakpoint.resize(800, name: DESKTOP),
          ResponsiveBreakpoint.autoScale(1700, name: 'XL'),
        ],
      ),
      debugShowCheckedModeBanner: false,
      onGenerateRoute: Routes.generateRoute,
      initialRoute: RouteScreen.Splash,
    );
  }
}
