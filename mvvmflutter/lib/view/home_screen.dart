import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:mvvm/data/response/status.dart';
import 'package:mvvm/untils/routes/route_screen.dart';
import 'package:mvvm/untils/untils.dart';
import 'package:mvvm/view_modle/home_view_model.dart';
import 'package:mvvm/view_modle/user_view_model.dart';
import 'package:provider/provider.dart';
import 'package:toast/toast.dart';

class Homescreen extends StatefulWidget {
  const Homescreen({super.key});

  @override
  State<Homescreen> createState() => _HomescreenState();
}

class _HomescreenState extends State<Homescreen> {
  HomeViewViewModel homeViewViewModel = HomeViewViewModel();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    homeViewViewModel.fetchmovielistapi();
  }

  @override
  Widget build(BuildContext context) {
    final userprefernce = Provider.of<UserViewModel>(context);

    return MaterialApp(
      home: Scaffold(
          appBar: AppBar(
            automaticallyImplyLeading: false,
            actions: [
              InkWell(
                  onTap: () {
                    userprefernce.remove().then((value) {
                      Navigator.pushNamed(context, RoutesName.login);
                    });
                  },
                  child: Center(child: Text('Logout'))),
              SizedBox(
                width: 20,
              )
            ],
          ),
          body: ChangeNotifierProvider<HomeViewViewModel>(
            create: (BuildContext context) => homeViewViewModel,
            child: Consumer<HomeViewViewModel>(
              builder: (context, value, child) {
                switch (value.movie.status) {
                  case Status.LOADING:
                    return CircularProgressIndicator();
                  case Status.ERROR:
                    return Text(value.movie.message.toString());
                    break;
                  case Status.COMPLETE:
                    return ListView.builder(
                      itemBuilder: (context, index) {
                        return Card(
                          child: Text('sdug'),
                        );
                      },
                    );
                }
                return Container();
              },
            ),
          )),
    );
  }
}
