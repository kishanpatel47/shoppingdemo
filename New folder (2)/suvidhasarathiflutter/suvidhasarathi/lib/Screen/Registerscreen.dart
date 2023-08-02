import 'dart:io';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:suvidha_sarathi/CustomDrawer/Drawer.dart';
import 'package:suvidha_sarathi/Navigationscreen/route_screen.dart';
import 'package:suvidha_sarathi/Screen/Login.dart';
import 'package:suvidha_sarathi/Unitls/Appcolor.dart';

import 'package:webview_flutter/webview_flutter.dart';
import 'dart:developer' as developer;

class NewRegister extends StatefulWidget {
  const NewRegister({Key? key}) : super(key: key);

  @override
  State<NewRegister> createState() => _NewRegisterState();
}

class _NewRegisterState extends State<NewRegister> {
  var call = 'mobile';
  var flag = 0;
  var _key = 1;
  late WebViewController controller;

  void resetWebViewToInitialUrl() {
    setState(() {
      key:
      _key + 1;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'New Register',
      home: Scaffold(
        drawer: CustomNavigationbar(),
        appBar: AppBar(
          backgroundColor: Appcolor.BLUE,
          title: Text('New Register'),
          titleSpacing: -2,
        ),
        body: Center(
          child: WebView(
            onWebViewCreated: (WebViewController wc) async {
              controller = wc;
            },
            javascriptMode: JavascriptMode.unrestricted,
            initialUrl:
                'https://suvidhasarathi.pmbi.co.in/Login?newregister=' + call,
            navigationDelegate: (action) {
              //     .contains('https://suvidhasarathi.pmbi.co.in/login')) {
              //   Navigator.pushNamed(context, RouteScreen.Login);
              // } else if (action.url.contains(
              //     'https://suvidhasarathi.pmbi.co.in/Login?newregister=mobile#')) {
              //   print('daa');
              //
              // }
              if (action.url
                  .contains('https://suvidhasarathi.pmbi.co.in/login')) {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Login()),
                );
              }

              return NavigationDecision.prevent;
            },
            onPageFinished: (String url) async {
              String? urllist = await controller.currentUrl();
              // developer.log('message' + url);
              print("Back Press URL : ${url}");

              if (url.startsWith(
                  'https://suvidhasarathi.pmbi.co.in/Login?newregister=mobile#')) {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Login()),
                );
              } else if (url
                  .contains('https://suvidhasarathi.pmbi.co.in/login')) {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Login()),
                );
              } else if (url
                  .contains('https://suvidhasarathi.pmbi.co.in/Login')) {
                if (flag == 0) {
                  flag = 1;
                } else {
                  this.resetWebViewToInitialUrl();
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => Login()),
                  );
                }
              } else {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Login()),
                );
              }
            },
          ),
        ),
      ),
    );
  }
}
