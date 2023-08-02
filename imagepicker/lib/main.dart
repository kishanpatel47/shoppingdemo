
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
void main(){
  runApp(imagepicker());
}
class imagepicker extends StatefulWidget {
  const imagepicker({super.key});

  @override
  State<imagepicker> createState() => _imagepickerState();
}

class _imagepickerState extends State<imagepicker> {
  
 late File _image;
  final picker =ImagePicker();
  PickedFile? pickedImage;
    Future getImage()async{
 pickedImage = await picker.getImage(source: ImageSource.camera);
  setState(() {
if(pickedImage!=null){
 _image= File(pickedImage!.path);
 Text(_image.path);
}
else{
  print('Not seleted image');
}
  });

    }
  @override
  Widget build(BuildContext context) {
 
    return MaterialApp(
      home: Scaffold(
        body: Center(
child: Text(_image.uri.path),

        ),
        floatingActionButton: FloatingActionButton(onPressed: () {
          getImage();
        },
        child: Icon(Icons.camera),
        
        ),
      )
    );
  }
}