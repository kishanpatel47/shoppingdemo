import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:http/http.dart' as http;

void main() {
  runApp(MaterialApp(home: googlemap()));
}

// class googlemap extends StatefulWidget {
//   const googlemap({Key? key}) : super(key: key);

//   @override
//   State<googlemap> createState() => _googlemapState();
// }

// class _googlemapState extends State<googlemap> {
//   Completer<GoogleMapController> _completer = Completer();

//   static const CameraPosition _kLake = CameraPosition(
//       bearing: 192.8334901395799,
//       target: LatLng(23.075790, 72.526413),
//       tilt: 59.440717697143555,
//       zoom: 10.151926040649414);
//   List<Marker> _list = [
//     Marker(
//         markerId: MarkerId('1'),
//         position: LatLng(23.075790, 72.526413),
//         infoWindow: InfoWindow(title: 'My Position')),
//     Marker(
//         markerId: MarkerId('2'),
//         position: LatLng(30.075790, 80.526413),
//         infoWindow: InfoWindow(title: 'My Position')),
//   ];

//   List<Marker> _marker = [];

//  List<dynamic> _maplist = [];
//  apicalling()async{
// http.Response  response = await http.get(Uri.parse('https://jsonplaceholder.typicode.com/users'));
//  _maplist = jsonDecode(response.body);
//  print("_maplist${_maplist}");

//  }
//   @override
//   void initState() {
//     // TODO: implement initState
//     super.initState();
//     _marker.addAll(_list);
//     apicalling();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       home: Scaffold(
//         body: SafeArea(
//           child: GoogleMap(
//             markers: Set<Marker>.of(_marker),
//             myLocationEnabled: true,
//             myLocationButtonEnabled: true,
//             compassEnabled: true,
//             mapType: MapType.satellite,
//             initialCameraPosition: _kLake,
//             onMapCreated: (controller) {
//               _completer.complete(controller);
//             },
//           ),
//         ),
//         floatingActionButton: FloatingActionButton(
//             onPressed: () async {
//               GoogleMapController controller = await _completer.future;
//               controller
//                   .animateCamera(CameraUpdate.newCameraPosition(CameraPosition(
//                 target: LatLng(25.075790, 80.526413),
//               )));
//               setState(() {});
//             },
//             child: Icon(Icons.location_disabled_outlined)),
//       ),
//     );
//   }
// }
class googlemap extends StatefulWidget {
  const googlemap({super.key});

  @override
  State<googlemap> createState() => _googlemapState();
}

class _googlemapState extends State<googlemap> {
  String email = '';
  String password = '';
  CameraPosition _cameraPosition =
      CameraPosition(target: LatLng(24.23565, 30.56235), zoom: 12, tilt: 59.00);
  List<Marker> _marker = [
    Marker(
        markerId: MarkerId('1'),
        position: LatLng(24.25635, 30.23565),
        infoWindow: InfoWindow(title: 'my postion')),
    Marker(
        markerId: MarkerId('2'),
        position: LatLng(25.25635, 30.23565),
        infoWindow: InfoWindow(title: 'my postion')),
    Marker(
        markerId: MarkerId('3'),
        position: LatLng(26.25635, 30.23565),
        infoWindow: InfoWindow(title: 'my postion')),
    Marker(
        markerId: MarkerId('4'),
        position: LatLng(10.25635, 30.23565),
        infoWindow: InfoWindow(title: 'my postion')),
  ];
  List<Marker> _list = [];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      color: Colors.white,
      home: Scaffold(
        body: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: [
              Expanded(
                  child: GoogleMap(
                      mapType: MapType.terrain,
                      markers: Set<Marker>.of(_marker),
                      initialCameraPosition: _cameraPosition))
            ],
          ),
        ),
      ),
    );
  }
}
