import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

void main() {
  runApp(const Googleapi());
}

class Googleapi extends StatefulWidget {
  const Googleapi({Key? key}) : super(key: key);

  @override
  State<Googleapi> createState() => _GoogleapiState();
}

class _GoogleapiState extends State<Googleapi> {
  static const CameraPosition _kLake = CameraPosition(
      bearing: 192.8334901395799,
      target: LatLng(23.075790, 72.526413),
      tilt: 59.440717697143555,
      zoom: 10.151926040649414);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: GoogleMap(initialCameraPosition: _kLake),
      ),
    );
  }
}
