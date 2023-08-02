// import 'dart:convert';

// import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart';
import 'dart:convert';

import 'package:flutter/material.dart';

void main() {
  runApp(const Signup());
}

class Signup extends StatefulWidget {
  const Signup({super.key});

  @override
  State<Signup> createState() => _SignupState();
}

class _SignupState extends State<Signup> {
  final TextEditingController _email = TextEditingController();
  final TextEditingController _password = TextEditingController();
  String _backgroundimage =
      'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTLWlzEHDrnN737RS-W_ER7DGGs59fP0dgh8s5N-MX_1w&s';
  void _singnup(String email, passowrd) async {
    try {
      Response response = await post(Uri.parse('https://reqres.in/api/login'),
          body: {'email': email, 'password': passowrd});
      if (response.statusCode == 200) {
        var data = jsonDecode(response.body.toString());
        // print(json.decode(response.body));
        setState(() {
          _backgroundimage =
              'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRvLydcy_bJf2VH9sI8NSECw3_ETmREeThIdKsoFIs&s';
        });

        Fluttertoast.showToast(msg: 'Ok');
        print('kishan');
        print('Login successfully ${data}');
      } else {
        Fluttertoast.showToast(msg: 'No');
        setState(() {
          _backgroundimage =
              'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRqf88vP5Y1h6xaI85tVMpfSuYbo85UY7K-jvk-PDZsnQ&s';
        });
        print('ok');
      }
    } catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Image(
                  height: 100,
                  width: 100,
                  image: NetworkImage(_backgroundimage)),
              Container(
                margin: const EdgeInsets.fromLTRB(0, 20, 0, 0),
                child: TextField(
                  controller: _email,
                  decoration: const InputDecoration(
                      hintStyle: TextStyle(color: Colors.blue),
                      hintText: 'Email'),
                ),
              ),
              Container(
                margin: const EdgeInsets.fromLTRB(0, 20, 0, 0),
                child: TextField(
                  controller: _password,
                  obscureText: true,
                  decoration: const InputDecoration(hintText: 'Password'),
                ),
              ),
              TextButton(
                onPressed: () {
                  _singnup(_email.text.toString(), _password.text.toString());
                },
                child: Container(
                    height: 50,
                    width: 350,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                        color: Colors.green,
                        borderRadius: BorderRadius.circular(20)),
                    margin: const EdgeInsets.fromLTRB(0, 20, 0, 0),
                    child: const Text(
                      'Sign up',
                      style: TextStyle(color: Colors.white),
                    )),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// class SignUpScreen extends StatefulWidget {
//   const SignUpScreen({Key? key}) : super(key: key);

//   @override
//   _SignUpScreenState createState() => _SignUpScreenState();
// }

// class _SignUpScreenState extends State<SignUpScreen> {
//   TextEditingController emailController = TextEditingController();
//   TextEditingController passwordController = TextEditingController();

//   void login(String email, password) async {
//     try {
//       Response response = await post(Uri.parse('https://reqres.in/api/login'),
//           body: {'email': email, 'password': password});

//       if (response.statusCode == 200) {
//         var data = jsonDecode(response.body.toString());
//         print(data['token']);
//         print('Login successfully');
//       } else {
//         print('failed');
//       }
//     } catch (e) {
//       print(e.toString());
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       home: Scaffold(
//         appBar: AppBar(
//           title: const Text('Sign Up Api'),
//         ),
//         body: Padding(
//           padding: const EdgeInsets.all(20.0),
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.center,
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: [
//               TextFormField(
//                 controller: emailController,
//                 decoration: InputDecoration(hintText: 'Email'),
//               ),
//               SizedBox(
//                 height: 20,
//               ),
//               TextFormField(
//                 controller: passwordController,
//                 decoration: InputDecoration(hintText: 'Password'),
//               ),
//               SizedBox(
//                 height: 40,
//               ),
//               GestureDetector(
//                 onTap: () {
//                   login(emailController.text.toString(),
//                       passwordController.text.toString());
//                 },
//                 child: Container(
//                   height: 50,
//                   decoration: BoxDecoration(
//                       color: Colors.green,
//                       borderRadius: BorderRadius.circular(10)),
//                   child: Center(
//                     child: Text('Login'),
//                   ),
//                 ),
//               )
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
