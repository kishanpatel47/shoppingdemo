import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:uidesign/Naivgation/route_screen.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: Text('Login Page'),
        ),
        body: Center(
          child: Container(
            margin: EdgeInsets.symmetric(vertical: 130, horizontal: 30),
            alignment: Alignment.center,
            decoration: BoxDecoration(
                color: Colors.blue, borderRadius: BorderRadius.circular(20.0)),
            child: Wrap(
              crossAxisAlignment: WrapCrossAlignment.center,
              children: [
                Container(
                  constraints: BoxConstraints(minHeight: 0.0, maxHeight: 500),
                  alignment: Alignment.bottomCenter,
                  child: Column(
                    children: [
                      CircleAvatar(
                        radius: 50,
                        backgroundImage: NetworkImage(
                            'https://img.lovepik.com/element/45006/8218.png_860.png'),
                      ),
                      TextField(
                        decoration: InputDecoration(hintText: 'Email'),
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
