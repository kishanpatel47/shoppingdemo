import 'dart:math';

import 'package:flutter/material.dart';

void main() {
  runApp(datalist());
}

List<dynamic> localdatabase = [
  {"id": "1", "name": "kishan", "image": "http://i.imgur.com/CqmBjo5.jpg"},
  {"id": "2", "name": "ayesh", "image": "http://i.imgur.com/CqmBjo5.jpg"},
  {"id": "3", "name": "kishan", "image": "http://i.imgur.com/CqmBjo5.jpg"},
  {"id": "4", "name": "ayuesh", "image": "http://i.imgur.com/CqmBjo5.jpg"},
  {"id": "5", "name": "ayuesh", "image": "http://i.imgur.com/CqmBjo5.jpg"},
];

class datalist extends StatefulWidget {
  const datalist({super.key});

  @override
  State<datalist> createState() => _datalistState();
}

class _datalistState extends State<datalist> {
  @override
  Widget build(BuildContext context) {
    selectionitem(index) => {
// print(index)
        };

    return MaterialApp(
      color: Colors.amber,
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.blue,
          title: Text('locallist'),
        ),
        body: Center(
            child: ListView.builder(
                itemCount: localdatabase.length,
                itemBuilder: (BuildContext context, int index) {
                  return TextButton(
                    onPressed: () {
                      // print(index);
                      selectionitem(index);
                    },
                    child: Column(
                      children: [
                        Container(
                          alignment: Alignment.topLeft,
                          width: double.infinity,
                          padding: EdgeInsets.all(10),
                          decoration: BoxDecoration(
                              color: Colors.primaries[
                                  Random().nextInt(Colors.primaries.length)],
                              borderRadius:
                                  BorderRadius.all(Radius.circular(50))),
                          child: Row(
                            children: [
                              Text(
                                localdatabase[index]["id"],
                                textAlign: TextAlign.start,
                                style: TextStyle(
                                    letterSpacing: 10, color: Colors.white),
                              ),
                              Image(
                                  height: 100,
                                  width: 100,
                                  image: NetworkImage(
                                      localdatabase[index]['image'])),
                              Container(
                                  margin: EdgeInsets.all(10),
                                  child: Text(
                                    localdatabase[index]["name"],
                                    style: TextStyle(color: Colors.white),
                                  ))
                            ],
                          ),
                        )
                      ],
                    ),
                  );
                })),
      ),
    );
  }
}
