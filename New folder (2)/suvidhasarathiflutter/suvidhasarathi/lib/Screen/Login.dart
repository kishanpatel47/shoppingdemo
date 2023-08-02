import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:suvidha_sarathi/CustomDrawer/Drawer.dart';
import 'package:suvidha_sarathi/Unitls/Appcolor.dart';
import 'package:suvidha_sarathi/Unitls/geticon.dart';
import 'package:suvidha_sarathi/Navigationscreen//route_screen.dart';
import 'package:suvidha_sarathi/Unitls/api_url.dart';
import 'package:suvidha_sarathi/model/login_model.dart';

import '../Unitls/https-untils.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  var email;
  var password;
  var isSuccess;
  bool _passwordVisible = false;
  TextEditingController _email = TextEditingController();

  TextEditingController _password = TextEditingController();
  @override
  Widget build(BuildContext context) {
    Future<dynamic> logincalling() async {
      var EncryptUserEmail =
          EcncyptService().encryptMyData(_email.text.toString());

      var EncryptUserPassword =
          EcncyptService().encryptMyData(_password.text.toString());

      print("Email $EncryptUserEmail");
      print("password $EncryptUserPassword");

      var data = {
        'LanguageID': "1",
        'Pass': EncryptUserPassword,
        "Email": EncryptUserEmail,
        "APIKey": "123",
        "AndroidKey": "",
        "IOSKey": ""
      };
      await post(Uri.parse("${AppUrl.liveBaseURl}/Login"), body: data)
          .then((response) {
        print("your resonse :: ${response.body.toString()}");

        LoginModel loginModel = LoginModel.fromJson(jsonDecode(response.body));
        print("Email ::::: ${loginModel.data!.email}");
        if (loginModel.returnCode == 1) {}
      });
      print(data);
    }

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
          drawer: CustomNavigationbar(),
          resizeToAvoidBottomInset: false,
          appBar: AppBar(
            backgroundColor: Appcolor.BLUE,
            title: const Text('Login'),
          ),
          body: Center(
            child: SingleChildScrollView(
              padding: EdgeInsets.all(32),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image(
                    width: 300,
                    fit: BoxFit.fitHeight,
                    image: AssetImage(getIcons.suvidha_sarathi),
                  ),
                  Container(
                    width: 350,
                    margin: const EdgeInsets.symmetric(
                        vertical: 12, horizontal: 25),
                    child: TextField(
                      controller: _email,
                      style: const TextStyle(color: Colors.black),
                      cursorColor: Colors.black,
                      keyboardType: TextInputType.emailAddress,
                      textInputAction: TextInputAction.next,
                      decoration: const InputDecoration(
                          prefixIcon: Padding(
                            padding: EdgeInsetsDirectional.only(
                              end: 20,
                            ),
                            child: Align(
                                widthFactor: 1.0,
                                heightFactor: 1.0,
                                child: Image(
                                    height: 25,
                                    width: 25,
                                    image: AssetImage(getIcons.emaillock))),
                          ),
                          hintText: 'Email',
                          hintStyle: const TextStyle(
                              fontSize: 15, color: Colors.black),
                          enabledBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: Colors.black)),
                          focusedBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: Colors.black))),
                    ),
                  ),
                  Container(
                    width: 350,
                    margin: const EdgeInsets.symmetric(
                        vertical: 12, horizontal: 25),
                    child: TextField(
                      controller: _password,
                      obscureText: !_passwordVisible,
                      keyboardType: TextInputType.emailAddress,
                      textInputAction: TextInputAction.done,
                      decoration: InputDecoration(
                          prefixIcon: Padding(
                            padding: EdgeInsetsDirectional.only(
                              end: 20,
                            ),
                            child: Align(
                                widthFactor: 1.0,
                                heightFactor: 1.0,
                                child: Image(
                                  height: 25,
                                  width: 25,
                                  image: AssetImage(getIcons.password),
                                )),
                          ),
                          suffixIcon: IconButton(
                            icon: Image(
                              height: 30,
                              width: 30,
                              image: AssetImage(_passwordVisible
                                  ? getIcons.Eyeon
                                  : getIcons.Eyeoff),
                            ),
                            color: Colors.black,
                            onPressed: () {
                              setState(() {
                                _passwordVisible = !_passwordVisible;
                              });
                            },
                          ),
                          hintText: 'Password',
                          hintStyle: const TextStyle(
                              fontSize: 15, color: Colors.black),
                          enabledBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: Colors.black)),
                          focusedBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: Colors.black))),
                    ),
                  ),
                  Text(
                    'ForgetPassword?',
                    style: TextStyle(height: 2.0),
                  ),
                  Container(
                      width: 200,
                      margin: EdgeInsetsDirectional.only(top: 15),
                      decoration: BoxDecoration(
                          color: Appcolor.BLUE,
                          borderRadius: BorderRadius.all(Radius.circular(25))),
                      child: TextButton(
                          onPressed: () {
                            // );

                            // Navigator.pushNamed(context, RouteScreen.Dashboard);
                          },
                          child: const Text(
                            'Login',
                            style: TextStyle(color: Colors.white),
                          ))),
                  TextButton(
                    onPressed: () {
                      // Navigator.push(
                      //   context,
                      //   MaterialPageRoute(builder: (context) => RouteScreen.Login()),
                      // );
                      Navigator.of(context, rootNavigator: true)
                          .pushNamed(RouteScreen.Registerscreen);
                    },
                    child: const Text.rich(
                      TextSpan(
                          text: 'Not a register user ?',
                          style: TextStyle(
                              color: Colors.black, fontSize: 15, height: 4.0),
                          children: [TextSpan(text: ' RegisterNow')]),
                    ),
                  )
                ],
              ),
            ),
          )),
    );
  }
}
