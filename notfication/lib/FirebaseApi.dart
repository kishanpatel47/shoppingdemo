// import 'package:firebase_core/firebase_core.dart';
// import 'package:firebase_messaging/firebase_messaging.dart';

// Future<void> handleBackgroundMessage(RemoteMessage message) async {
//   print('Title ${message.notification?.title}');
//   print('Body ${message.notification?.body}');
//   print('Payload ${message.data}');
// }

// class FirebaseApi {
//   final firebaseMessaging = FirebaseMessaging.instance;
//   Future<void> initNotifications() async {
//     await firebaseMessaging.requestPermission();
//     final fcmToken = await firebaseMessaging.getToken();
//     print('Token ${fcmToken}');
//     FirebaseMessaging.onBackgroundMessage(handleBackgroundMessage);
//   }
// }
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'dart:io';

class FirebaseApi {
  final FirebaseMessaging _firebaseMessaging = FirebaseMessaging.instance;

  Future<void> initNotifications() async {
    // Request permission for handling notifications (optional, but recommended).
    NotificationSettings settings = await _firebaseMessaging.requestPermission(
      alert: true,
      announcement: false,
      badge: true,
      carPlay: false,
      criticalAlert: false,
      provisional: true,
      sound: true,
    );

    // On iOS, you need to request the user's permission to display alerts, sounds, or badges.
    if (kIsWeb || Platform.isIOS) {
      if (settings.authorizationStatus == AuthorizationStatus.authorized ||
          settings.authorizationStatus == AuthorizationStatus.provisional) {
        print("User granted permission");
      } else {
        print("User declined permission or hasn't accepted it yet.");
      }
    }

    // Get the FCM token (if you need to send individual notifications).
    String? token = await _firebaseMessaging.getToken();
    print('FCM Token: $token');

    // Configure how to handle incoming messages (foreground and background).
    FirebaseMessaging.onMessage.listen((RemoteMessage message) {
      print("Received a message: ${message.notification?.body}");
      print("Received a message: ${message.notification?.title}");
      print("Received a message: ${message.data}");

      // Handle the notification or show a custom UI.
    });

    FirebaseMessaging.onMessageOpenedApp.listen((RemoteMessage message) {
      print(
          "Opened app from background message: ${message.notification?.body}");
      // Handle the notification or navigate to the appropriate screen.
    });
  }
}
