import 'package:flutter/material.dart';

class Aboutus extends StatefulWidget {
  const Aboutus({Key? key}) : super(key: key);

  @override
  State<Aboutus> createState() => _AboutusState();
}

class _AboutusState extends State<Aboutus> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('About us'),
        ),
        body: Center(
          child: Text('asdgi'),
        ),
      ),
    );
  }
}
