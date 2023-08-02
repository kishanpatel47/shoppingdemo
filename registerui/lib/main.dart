import 'package:flutter/material.dart';
void main(){
  runApp(MaterialApp(home: regisetui()));
}
class regisetui extends StatefulWidget {
  const regisetui({super.key});

  @override
  State<regisetui> createState() => _regisetuiState();
}

class _regisetuiState extends State<regisetui> {


String name ="";
String lastname ="";

String email ="";

String mobile ="";

String password ="";
TextEditingController _name =TextEditingController();
TextEditingController _lastname =TextEditingController();
TextEditingController _email =TextEditingController();

TextEditingController _mobile =TextEditingController();
TextEditingController _passowrd =TextEditingController();


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(appBar: AppBar(title: Center(child: Text('Registerui')),),
      body:  Center(
child: Column(
 crossAxisAlignment: CrossAxisAlignment.center,
 mainAxisAlignment: MainAxisAlignment.center,
  children: [
Center(
  child:   FlutterLogo(duration: Duration(microseconds: 100000),curve: Curves.bounceIn,
  
  size: 50,),
),

Container(

  decoration: BoxDecoration(
  color: Colors.blue,
    borderRadius: BorderRadius.circular(20)
  ),
margin: EdgeInsets.fromLTRB(10, 20, 10, 0),

child: TextField(
  controller: _name,
  onChanged: (value) {
    
    setState(() {
      name=value;
    });
    
  },
keyboardType: TextInputType.name,
  style: TextStyle(color: Colors.white),
cursorColor: Colors.white,
decoration: InputDecoration(
  hintText: 'firstname',

  border: InputBorder.none,
  hintStyle: TextStyle(color: Colors.white),

contentPadding: EdgeInsets.fromLTRB(10, 0, 0, 0)

),




),


)
,Container(

  decoration: BoxDecoration(
  color: Colors.blue,
    borderRadius: BorderRadius.circular(20)
  ),
margin: EdgeInsets.fromLTRB(10, 20, 10, 0),

child: TextField(
  controller: _lastname,
onChanged: (value) {
  setState(() {
    lastname=value;
  });
},
  keyboardType: TextInputType.text,

  style: TextStyle(color: Colors.white),
cursorColor: Colors.white,
decoration: InputDecoration(
  hintText: 'lastname',
  
  border: InputBorder.none,
  hintStyle: TextStyle(color: Colors.white),

contentPadding: EdgeInsets.fromLTRB(10, 0, 0, 0)

),

),


)

,
Container(

  decoration: BoxDecoration(
  color: Colors.blue,
    borderRadius: BorderRadius.circular(20)
  ),
margin: EdgeInsets.fromLTRB(10, 20, 10, 0),

child: TextField(
  controller: _mobile,
 onChanged: (value) {
setState(() {
  mobile=value;
});
 },
 keyboardType: TextInputType.number,
  style: TextStyle(color: Colors.white),
cursorColor: Colors.white,
decoration: InputDecoration(
  hintText: 'mobile',

  border: InputBorder.none,
  hintStyle: TextStyle(color: Colors.white),

contentPadding: EdgeInsets.fromLTRB(10, 0, 0, 0)

),

),


)
,
Container(

  decoration: BoxDecoration(
  color: Colors.blue,
    borderRadius: BorderRadius.circular(20)
  ),
margin: EdgeInsets.fromLTRB(10, 20, 10, 0),

child: TextField(
  controller: _email,
  onChanged: (value) {
 setState(() {
   email=value;
 });
  },
 keyboardType: TextInputType.emailAddress,
  style: TextStyle(color: Colors.white),
cursorColor: Colors.white,
decoration: InputDecoration(
  hintText: 'Email',

  border: InputBorder.none,
  hintStyle: TextStyle(color: Colors.white),

contentPadding: EdgeInsets.fromLTRB(10, 0, 0, 0)

),

),


),

Container(

  decoration: BoxDecoration(
  color: Colors.blue,
    borderRadius: BorderRadius.circular(20)
  ),
margin: EdgeInsets.fromLTRB(10, 20, 10, 0),

child: TextField(
  controller: _passowrd,
  onChanged: (value) {

    setState(() {
    password=value;
      
    });
  },
  obscureText: true,
  keyboardType: TextInputType.streetAddress,
  style: TextStyle(color: Colors.white),
cursorColor: Colors.white,
decoration: InputDecoration(
  hintText: 'Password',
  border: InputBorder.none,
  hintStyle: TextStyle(color: Colors.white),

contentPadding: EdgeInsets.fromLTRB(10, 0, 0, 0)

),

),


),

TextButton(onPressed: (){



}, child: Container(

 alignment: Alignment.center,
  decoration: BoxDecoration(
    borderRadius: BorderRadius.circular(50),
    color: Colors.blue
  ),
 width: MediaQuery.of(context).size.width *.6-.45,
 padding: EdgeInsets.all(10),
  margin: EdgeInsets.fromLTRB(0, 30, 0, 0),
  child: Text('Login',style: TextStyle(color: Colors.white),),
)),

    
    
 Card(
child: Column(
  children: [
    Text(name.toString()),
    
    Text(lastname.toString()),
    Text(email.toString()),
    Text(mobile.toString()),
    Text(password.toString())
    
    
  ],
),

 )





  ],
),


      ),
      

      ),


      )
    
    
    
    
    ;
  }
}