// import 'dart:convert';

// import 'package:flutter/material.dart';
// import 'package:http/http.dart'as http;
// void main() {
//   runApp(const apicalling());
// }
// class apicalling extends StatefulWidget {
//   const apicalling({super.key});

//   @override
//   State<apicalling> createState() => _apicallingState();
// }

// class _apicallingState extends State<apicalling> {
//   List userdata=[];
//   Future<void> listdata() async {
//  http.Response response = await http.get(Uri.parse('https://api.instantwebtools.net/v1/airlines'));
//    userdata =jsonDecode(response.body);
//   print(userdata);
//   } 
  
//   @override
//   void initState() {
//     // TODO: implement initState
//     super.initState();
//     listdata();
//   }
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       home: Scaffold(
//         body:  Center(
//         child: FutureBuilder(
//        future: listdata(),   
          
//           builder: (context, snapshot) {
//           if(snapshot.hasData){
//             return Center(child: Text('Loading',style: TextStyle(color: Colors.black,fontSize: 20),),);
//           }
//           else {

//           return ListView.builder(
            
//             itemCount: userdata.length,
//             itemBuilder:(context, index) {
//             return Card(
//         child: Row(
          
//           children: [

// Text(userdata[index]['name']),
// Image(
//   height: 100,
//   width: 100,
//   image: NetworkImage(userdata[index]["logo"]))
//           ]
          
//           ),
//             );
//           },);
//           }
          
//         },
//       ), ),
//       )    
//     );
//   }
// }

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

import 'package:apicalling/Imagesilder.dart';
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
 late final String data1;
 
Future getdata () async {
  http.Response response = await http.get(Uri.parse('https://dummyjson.com/products'));
data=jsonDecode(response.body);
setState(() {
  userdata =data["products"];
});
print(userdata);

}
@override
  void initState() {
    super.initState();
    getdata();
  }

 @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Center(
          child: ListView.builder(
            itemCount: userdata.length,
            
            itemBuilder:(context, index) {
            return TextButton(
              onPressed: () {
            Navigator.push(context,MaterialPageRoute(builder: (context) => MyWidget(list: userdata[index]["images"]),) ); 
             
              },
              child: Card(
            child: Column(
              children: [
                Image(image: NetworkImage(userdata[index]["thumbnail"]))
              ],
            ),
              ),
            );
          },)
        )
      ),
    );
  }
}