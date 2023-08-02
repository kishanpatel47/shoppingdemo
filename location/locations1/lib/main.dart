import 'package:app_settings/app_settings.dart';
import 'package:flutter/material.dart';
import 'package:location/location.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Home(),
    );
  }
}

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    gpslocation();
  }

  gpslocation() async {
    Location location = new Location();
    bool ison = await location.serviceEnabled();
    if (!ison) {
      //if defvice is off
      bool isturnedon = await location.requestService();
      if (isturnedon) {
        print("GPS device is turned ON");
      } else {
        print("GPS Device is still OFF");
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Turn On GPS in Flutter"),
        backgroundColor: Colors.redAccent,
      ),
      body: Container(
          alignment: Alignment.center,
          child: Column(children: [
            ElevatedButton(
                onPressed: () async {},
                child: Text("Turn On GPS | Location Package")),
            ElevatedButton(
                onPressed: () async {
                  AppSettings.openLocationSettings();
                },
                child: Text("Turn On GPS | App Setting Package"))
          ])),
    );
  }
}
