import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:localnotfication/Notficationlist.dart';
import 'package:localnotfication/main.dart';
import 'package:permission_handler/permission_handler.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  static const String title = "login";

  static const String body = "You will be contacted by us very soon. ";
  void showNotifications(List<String> arrayList) async {
    PermissionStatus status = await Permission.notification.request();

    if (status == PermissionStatus.granted) {
      setState(() {
        count++;
      });

      AndroidNotificationDetails androiddeatails = AndroidNotificationDetails(
          'notification-youtube', 'youtube Notification',
          priority: Priority.max, importance: Importance.max);

      DarwinNotificationDetails darwinNotificationDetails =
          DarwinNotificationDetails(
              presentAlert: true, presentBadge: true, presentSound: true);

      NotificationDetails details = NotificationDetails(
          android: androiddeatails, iOS: darwinNotificationDetails);
      final StringBuffer stringBuffer = StringBuffer();
      for (final item in arrayList) {
        stringBuffer.writeln(item);
      }
      await notificationsPlugin.show(
        0,
        'array list',
        stringBuffer.toString(),
        details,
        payload: 'item_1',
      );
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => AnotherScreen(arrayList: arrayList),
        ),
      );
    } else if (status == PermissionStatus.denied) {
      openAppSettings();
    } else if (status == PermissionStatus.permanentlyDenied) {
      openAppSettings();
    }
  }

  var count = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          List<String> arrayList = ['Item 1', 'Item 2', 'Item 3', 'Item 4'];
          showNotifications(arrayList);
        },
        child: Icon(Icons.notification_add),
      ),
      body: SafeArea(
          child: Center(
        child: TextButton(
          onPressed: () {},
          child: Badge(
            largeSize: 20,
            label: Text(' ${count}'),
            padding: EdgeInsets.all(5),
            alignment: AlignmentDirectional.center,
            child: Icon(
              Icons.notifications,
              size: 50,
            ),
          ),
        ),
      )),
    );
  }
}
