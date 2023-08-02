// import 'package:flutter/material.dart';
// import 'package:flutter_local_notifications/flutter_local_notifications.dart';
// import 'package:localnotfication/home_screen.dart';

// FlutterLocalNotificationsPlugin notificationsPlugin =
//     FlutterLocalNotificationsPlugin();

// void main() {
//   runApp(localnotfication());
//   notificationconfigation();
// }

// notificationconfigation() async {
//   AndroidInitializationSettings androidInitializationSettings =
//       AndroidInitializationSettings("@mipmap/ic_launcher");
//   DarwinInitializationSettings darwinInitializationSettings =
//       DarwinInitializationSettings(
//     requestAlertPermission: true,
//     requestBadgePermission: true,
//     requestCriticalPermission: true,
//   );
//   InitializationSettings initializationSettings = InitializationSettings(
//       android: androidInitializationSettings,
//       iOS: darwinInitializationSettings);
//   bool? initialize =
//       await notificationsPlugin.initialize(initializationSettings);
// }

// class localnotfication extends StatefulWidget {
//   const localnotfication({super.key});

//   @override
//   State<localnotfication> createState() => _localnotficationState();
// }

// class _localnotficationState extends State<localnotfication> {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       home: Scaffold(body: HomeScreen()),
//     );
//   }
// }
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:localnotfication/home_screen.dart';
import 'package:timezone/data/latest_10y.dart';

FlutterLocalNotificationsPlugin notificationsPlugin =
    FlutterLocalNotificationsPlugin();

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  initializeTimeZones();

  AndroidInitializationSettings androidSettings =
      AndroidInitializationSettings("@mipmap/ic_launcher");

  DarwinInitializationSettings iosSettings = DarwinInitializationSettings(
      requestAlertPermission: true,
      requestBadgePermission: true,
      requestCriticalPermission: true,
      requestSoundPermission: true);

  InitializationSettings initializationSettings =
      InitializationSettings(android: androidSettings, iOS: iosSettings);

  bool? initialized = await notificationsPlugin.initialize(
      initializationSettings, onDidReceiveNotificationResponse: (response) {
    log(response.payload.toString());
  });

  log("Notifications: $initialized");

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomeScreen(),
    );
  }
}
