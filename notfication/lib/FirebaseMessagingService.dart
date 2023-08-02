import 'package:firebase_messaging/firebase_messaging.dart';

class FirebaseMessagingService {
  final FirebaseMessaging _firebaseMessaging = FirebaseMessaging.instance;

  Future<void> setupFirebaseMessaging() async {
    // Request permission for the device to receive notifications (only for iOS).
    NotificationSettings settings = await _firebaseMessaging.requestPermission(
      alert: true,
      badge: true,
      sound: true,
    );

    // Handle the case when the user has denied permission.
    if (settings.authorizationStatus == AuthorizationStatus.denied) {
      print('User denied notification permission');
      return;
    }

    // Configure Firebase messaging onMessage, onBackgroundMessage, and onLaunch callbacks.
    FirebaseMessaging.onMessage.listen((RemoteMessage message) {
      print('onMessage: ${message.notification!.body}');
      // Handle foreground notification here (optional).
    });

    FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);

    FirebaseMessaging.onMessageOpenedApp.listen((RemoteMessage message) {
      print('onMessageOpenedApp: ${message.notification!.body}');
      // Handle notification when the app is in the background and opened by tapping on it (optional).
    });
  }

  Future<void> _firebaseMessagingBackgroundHandler(
      RemoteMessage message) async {
    print('onBackgroundMessage: ${message.notification!.body}');
    // Handle background notification here (optional).
  }
}
