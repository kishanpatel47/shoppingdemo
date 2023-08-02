import 'dart:io';
import 'package:flutter/foundation.dart' as web;
import 'package:flutter/material.dart';
import 'package:suvidha_sarathi/CustomDrawer/Drawerlist.dart';
import 'package:suvidha_sarathi/Navigationscreen/route_screen.dart';
import 'package:suvidha_sarathi/Unitls/Appcolor.dart';
import 'package:suvidha_sarathi/Unitls/geticon.dart';

import '../model/Drawermodel.dart';

class CustomNavigationbar extends StatefulWidget {
  const CustomNavigationbar({Key? key}) : super(key: key);

  @override
  State<CustomNavigationbar> createState() => _CustomNavigationbarState();
}

class _CustomNavigationbarState extends State<CustomNavigationbar> {
  late int selectedIndex = 0;
late String appName;
late String packageName;
late String version;
late String buildNumber;

  @override
  void initState(){
    super.initState();
   
    _color = false;
  }
    



  late bool _color;
  handleColor(Drawermodel item) {
    // setSelected(row.id);
    selectedIndex = item.id;

    print("your  button $selectedIndex");
  }

  @override
  Widget build(BuildContext context) {
    var buildNumber, version;
  
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    return /*web.kIsWeb
        ? SizedBox(
            width: 350,
            child: Drawer(
                child: Column(children: [
              drawerHeader(),
              drawerlist(),
            ])),
          )
        : web.kIsWeb
            ? SizedBox(
                width: 650,
                child: Drawer(
                    child: ListView(padding: EdgeInsets.zero, children: [
                  drawerHeader(),
                  drawerlist(),
                ])),
              )
            : web.kIsWeb
                ? SizedBox(
                    width: 800,
                    child: Drawer(
                        child: ListView(
                            padding: EdgeInsets.zero,
                            children: [drawerHeader()])))
                : web.kIsWeb
                    ? SizedBox(
                        width: 900,
                        child: Drawer(
                            child:
                                ListView(padding: EdgeInsets.zero, children: [
                          drawerHeader(),
                          drawerlist(),
                        ])))
                    : web.kIsWeb
                        ? SizedBox(
                            width: 1050,
                            child: Drawer(
                                child: ListView(
                                    padding: EdgeInsets.zero,
                                    children: [
                                  drawerHeader(),
                                  drawerlist(),
                                ])))
                        : web.kIsWeb
                            ? SizedBox(
                                width: 1280,
                                child: Drawer(
                                    child: ListView(
                                        padding: EdgeInsets.zero,
                                        children: [
                                      drawerHeader(),
                                      drawerlist(),
                                    ])))
                            : Platform.isAndroid
                                ? SizedBox(
                                    width: width * 0.7,
                                    child: Drawer(
                                        child: ListView(
                                            padding: EdgeInsets.zero,
                                            children: [
                                          drawerHeader(),
                                          drawerlist(),
                                        ])))
                                : Container();*/
        Drawer(
            child: Column(children: [
      drawerHeader(),
      Expanded(flex: 10, child: drawerlist()),
      Expanded(
        flex: 0,
        child: Container(
          padding: EdgeInsets.all(5),
          color: Colors.red,
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  InkWell(
                      onTap: (){
                      print('facebook');
                    },
                    child: Container(
                      margin: EdgeInsets.fromLTRB(0, 0, 8, 0),
                      child: Image(
                        height: 25,
                        width: 25,
                        image: AssetImage(getIcons.facebook),
                      ),
                    ),
                  ),
                  InkWell(
                    onTap: (){
                      print('instagram');
                    },
                    child: Container(
                         margin: EdgeInsets.fromLTRB(0, 0, 8, 0),
                      child: Image(
                        height: 25,
                        width: 25,
                        image: AssetImage(getIcons.instagram),
                      ),
                    ),
                  ),
                  InkWell(
                    onTap: (){
                      print('twitter');
                    },
                    child: Container(
                         margin: EdgeInsets.fromLTRB(0, 0, 2, 0),
                      child: Image(
                        height: 25,
                        width: 25,
                        image: AssetImage(getIcons.twitter),
                      ),
                    ),
                  ),
                ],
              ),
              Container(
                alignment: Alignment.topRight,
                margin: EdgeInsets.symmetric(vertical: 5),
                child: Text.rich(TextSpan(
                    text: 'App version ',
                    style: TextStyle(fontSize: 14),
                    children: [TextSpan(text: version)])),
              )
            ],
          ),
        ),
      )
    ]));
  }

  Widget drawerHeader() {
    return Center(
      child: Container(
        
        width: double.infinity,
        child: DrawerHeader(
          padding: EdgeInsets.only(left: 16),
          decoration: BoxDecoration(color: Appcolor.BLUE),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.max,
            children: [
              Expanded(
                child: Container(
                  margin: EdgeInsets.fromLTRB(0, 18, 0, 0),
                  height: 95,
                  width: 95,
                  decoration: BoxDecoration(
                      color: Appcolor.WHITE, shape: BoxShape.circle),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(200),
                    child: Image.asset(
                      fit: BoxFit.contain,
                      getIcons.suvidha_sarathi,
                      width: 100,
                    ),
                  ),
                ),
              ),

              // Text('flutter.com',
              //   style: TextStyle(
              //     color:  Colors.white
              //   ),
              // ),
              // SizedBox(height: 4,),

              InkWell(
                onTap: () => {
                  Navigator.of(context, rootNavigator: true)
                      .pushNamed(RouteScreen.Login)
                },
                child: Container(
                  padding: web.kIsWeb
                      ? EdgeInsets.symmetric(
                          horizontal:
                              MediaQuery.of(context).size.width * 0.0013)
                      : EdgeInsets.symmetric(
                          horizontal:
                              MediaQuery.of(context).size.width * 0.011),
                  margin: EdgeInsets.fromLTRB(2, 12, 0, 20),
                  child: Text(
                    'Login | Register',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget drawerlist() {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    return SingleChildScrollView(
      child: Container(
        color: Colors.white,
        padding: EdgeInsets.all(8),
        child: Column(
          children: model.map((item) {
            return Container(
          
        
                decoration: BoxDecoration(
                    color:
                        item.id == selectedIndex ? Appcolor.BLUE : Colors.white,
                    borderRadius: BorderRadius.all(Radius.circular(20))),

                // margin: EdgeInsets.symmetric(horizontal: 10),
                child: ListTileTheme(
                  child: ListTile(
                    selectedColor: Colors.black26,
                    hoverColor:Colors.black38,
                      tileColor: item.id == selectedIndex ? Appcolor.BLUE : null,
                      onTap: () {
                        setState(() {
                          handleColor(item);
                        });
                      },
                      leading: Image.asset(
                        item.icon,
                        width: 25,
                        height: 25,
                        color: item.id == selectedIndex
                            ? Appcolor.WHITE
                            : Colors.black,
                      ),
                      title: Text(
                        item.name,
                        style: TextStyle(
                          color: item.id == selectedIndex
                              ? Appcolor.WHITE
                              : Colors.black,
                        ),
                        textAlign: TextAlign.left,
                      )),
                ));

            // return
          }).toList(),
        ),
      ),
    );
  }
}
