import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

import 'package:mvvm/view_modle/servies/splash_serveries.dart';

class SplashView extends StatefulWidget {
  const SplashView({super.key});

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  SplashServices splashServices = SplashServices();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    splashServices.checkAuthentication(context);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Center(
          child: Image(
              height: double.infinity,
              width: double.infinity,
              fit: BoxFit.fill,
              image: NetworkImage(
                  'https://i.pinimg.com/originals/b8/9c/af/b89caf7231d3f011f96831ffa17fa41f.jpg')),
        ),
      ),
    );
  }
}
