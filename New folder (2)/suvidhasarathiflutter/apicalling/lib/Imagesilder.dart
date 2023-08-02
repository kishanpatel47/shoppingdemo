
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:light_carousel/light_carousel.dart';

class MyWidget extends StatefulWidget {
  final List list;
  const MyWidget({super.key, required this.list});

  @override
  State<MyWidget> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<MyWidget> {
  late List<Widget> _list;
 
 
 @override
  void initState() {
      
    // TODO: implement initState
    super.initState();
    print("object${widget.list}");
  }
 
  @override
  Widget build(BuildContext context) {
    var imagedata =widget.list;
    return MaterialApp(
      home: Scaffold(
        body: LightCarousel(
          autoPlay: true,
          animationDuration: Duration(microseconds: 1),
        animationCurve: Curves.bounceIn,
          images: <Widget>[
            for (var i = 0; i < widget.list.length; i++)
              Container(
                  margin: const EdgeInsets.only(top: 20.0, left: 20.0),
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: NetworkImage(widget.list[i].toString()),
                      fit: BoxFit.fitHeight,
                    ),
                    // border:
                    //     Border.all(color: Theme.of(context).accentColor),
                    borderRadius: BorderRadius.circular(32.0),
                  ),
                ),                                     
          ],
        ),
  //       LightCarousel(
  //          boxFit: BoxFit.cover,
  //               autoPlay: true,
  //               animationCurve: Curves.fastOutSlowIn,
  //               animationDuration: const Duration(milliseconds: 1000),
  //               dotSize: 6.0,
  //               dotIncreasedColor: const Color(0xFFFF335C),
  //               dotBgColor: Colors.transparent,
  // dotVerticalPadding: 10.0,
  //               showIndicator: true,
  //               indicatorBgPadding: 7.0,
                
  //                images:  [

                
  //                 // NetworkImage(widget.list[0].toString()),
                  
  //                 // NetworkImage(widget.list[1].toString()),
                  
  //                 // NetworkImage(widget.list[2].toString()),



  //                 //         NetworkImage(widget.list[3].toString())
  //               ],
  //       )
          ),
  
      );
     }
}