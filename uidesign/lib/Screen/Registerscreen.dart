import 'package:flutter/material.dart';

class Registerscreen extends StatefulWidget {
  const Registerscreen({Key? key}) : super(key: key);

  @override
  State<Registerscreen> createState() => _RegisterscreenState();
}

class _RegisterscreenState extends State<Registerscreen> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          leading: IconButton(
            onPressed: () {},
            icon: Icon(Icons.chevron_left),
          ),
          title: Text('Login Page'),
        ),
        body: Container(
          alignment: Alignment.center,
          child: ClipRRect(
            borderRadius: BorderRadius.all(Radius.circular(30)),
            child: Card(
              color: Colors.white70,
              child: Container(
                height: 450,
                width: 250,
                alignment: Alignment.center,
                margin: EdgeInsets.symmetric(vertical: 20, horizontal: 20),
                child: Container(
                  child: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Image(
                            height: 80,
                            width: 80,
                            fit: BoxFit.fill,
                            image: NetworkImage(
                                'https://static.vecteezy.com/system/resources/previews/008/552/562/original/uv-radiation-icon-solar-ultraviolet-light-symbol-for-graphic-design-logo-web-site-social-media-mobile-app-ui-illustration-vector.jpg')),
                        SizedBox(
                          height: 11,
                        ),
                        Text(
                          'WELCOME  NOW',
                          style: TextStyle(
                              fontSize: 15, fontWeight: FontWeight.bold),
                        ),
                        SizedBox(
                          height: 11,
                        ),
                        Container(
                          child: Row(
                            children: [
                              Icon(Icons.ice_skating),
                              Container(
                                child: Text('da'),
                              )
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 7,
                        ),
                        TextButton(
                            onPressed: () {},
                            style: OutlinedButton.styleFrom(
                              shape: StadiumBorder(),
                            ),
                            child: Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                color: Colors.blue,
                              ),
                              width: 150,
                              padding: EdgeInsets.all(10),
                              child: Text(
                                'Register',
                                textAlign: TextAlign.center,
                                style: TextStyle(color: Colors.white),
                              ),
                            )),
                        Text('data')
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
