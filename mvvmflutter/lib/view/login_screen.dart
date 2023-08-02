import 'package:flutter/material.dart';
import 'package:mvvm/res/components/round_button.dart';
import 'package:mvvm/view_modle/auth_view_model.dart';
import 'package:provider/provider.dart';

class loginscreen extends StatefulWidget {
  const loginscreen({super.key});

  @override
  State<loginscreen> createState() => _loginscreenState();
}

class _loginscreenState extends State<loginscreen> {
  final TextEditingController _email = TextEditingController();
  final TextEditingController _password = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final authViewmodel = Provider.of<AuthViewModel>(context);
    return MaterialApp(
      home: Scaffold(
        body: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                margin: EdgeInsets.all(20),
                child: TextField(
                    controller: _email,
                    decoration: InputDecoration(hintText: 'Email')),
              ),
              Container(
                margin: EdgeInsets.all(20),
                child: TextField(
                    controller: _password,
                    decoration: InputDecoration(hintText: 'password')),
              ),
              RoundButton(
                // onPressed: () {
                //   Map data = {'email': _email.text, 'password': _password.text};
                //   authViewmodel.loginApi(data, context);
                // },
                loading: authViewmodel.loading,
                onpress: () {
                  Map data = {'email': _email.text, 'password': _password.text};
                  authViewmodel.loginApi(data, context);
                },
                title: 'Login',
              )
            ]),
      ),
    );
  }
}
