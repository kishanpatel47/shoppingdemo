// import 'dart:async';

// import 'package:flutter/material.dart';

// void main() {
//   runApp(uidesign());
// }

// class uidesign extends StatefulWidget {
//   const uidesign({Key? key}) : super(key: key);

//   @override
//   State<uidesign> createState() => _uidesignState();
// }

// class _uidesignState extends State<uidesign>  with SingleTickerProviderStateMixin {
 
//  Widget build(BuildContext context) {
//   return MaterialApp(
//   home: Scaffold(
//     body: Column(
//       children: [
//         Flexible(
//           flex: 2,
          
//           child: Align(
            
//             alignment: Alignment.center,
//             child: Container(
// height: 400,
// decoration: BoxDecoration(
// color: Colors.amber,
// borderRadius: BorderRadius.circular(20)

// ),
// width: 450,
// child:  SingleChildScrollView(
//   child: Column(
//     children: [
//       FlutterLogo(
// size: 80,


//       ),

// Container(
//   width: 250,
// child: TextField(

// decoration: InputDecoration(
//   hintText: 'Email'
// ),

// ),

// ),

// Container(
//   width: 250,
// child: TextField(

// decoration: InputDecoration(
//   hintText: 'Email'
// ),

// ),

// ),
// Container(
//   width: 250,
// child: TextField(

// decoration: InputDecoration(
//   hintText: 'Email'
// ),

// ),

// ),

// Container(
//   width: 250,
// child: TextField(

// decoration: InputDecoration(
//   hintText: 'Email'
// ),

// ),

// ),
// Container(
//   width: 250,
// child: TextField(

// decoration: InputDecoration(
//   hintText: 'Email'
// ),

// ),

// ),

// Container(
//   width: 250,
// margin: EdgeInsets.fromLTRB(0,0, 0,15),
// child: TextField(

// decoration: InputDecoration(
//   hintText: 'Email'
// ),

// ),

// ),
// Container(
//   width: 250,
// margin: EdgeInsets.fromLTRB(0,0, 0,15),
// child: TextField(

// decoration: InputDecoration(
//   hintText: 'Email'
// ),

// ),

// ),

//     ],
//   ),
// ),


//             )))
//       ],
//     )
//   ),
//  );
//  }
// }






import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:async';
void main(){
  runApp(apicalling());
}
class apicalling extends StatefulWidget {
  const apicalling({super.key});

  @override
  State<apicalling> createState() => _apicallingState();
}

class _apicallingState extends State<apicalling> {
late Map data;
 List userdata =[];
 
Future<void> getdata () async {
  http.Response response = await http.get(Uri.parse('https://dummyapi.io/data/v1/post?limit=10'));
  userdata =jsonDecode(response.body);
print(userdata);
}
@override
  void initState() {
    // TODO: implement initState
    super.initState();
    getdata();
  }

 @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Center(
          child: FutureBuilder(
        
        future: getdata(),
        builder: (context, snapshot) {
          if(snapshot.hasData){
            return Text('Logig');
          }
          else {
            return ListView.builder(
              itemCount: userdata.length,
              
              itemBuilder:(context, index) {
              return Card(
        
        child: Column(children: [
          Text(userdata[index]["name"]),
          
          Text(userdata[index]["username"]),
          Text(userdata[index]["email"]),
         
        
          Text(userdata[index]["address"]["city"]),
          Text(userdata[index]["address"]["geo"]["lat"]),
        
        
        ]),
        
              );
        
            },);
          }
        },
          ),
        )
      ),
    );
  }
}