import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:localapicalling2/datalist.dart';
import 'package:flutter/services.dart' as rootBundle;

void main() {
  runApp(Secondfile());
}

class Secondfile extends StatefulWidget {
  const Secondfile({Key? key}) : super(key: key);

  @override
  State<Secondfile> createState() => _SecondfileState();
}

class _SecondfileState extends State<Secondfile> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(
          appBar: AppBar(
            title: Center(
              child: Text('Api'),
            ),
          ),
          body: FutureBuilder(
            future: Readlist(),
            builder: (context, data) {
              if (data.hasError) {
                return Center(
                  child: Text('${data.error}'),
                );
              } else if (data.hasData) {
                var item = data.data as List<datalist>;

                return ListView.builder(
                    itemCount: item == null ? 0 : item.length,
                    itemBuilder: (context, index) {
                      return Card(
                        color: Colors.cyan,
                        margin: EdgeInsets.all(10),
                        child: Text(item[index].name.toString()),
                      );
                    });
              } else {
                return Text('data');
              }
            },
          ),
        ));
  }
}

Future<List<datalist>> Readlist() async {
  final jsondata =
      await rootBundle.rootBundle.loadString('jsonfile/productlist.json');
  final list = json.decode(jsondata) as List<dynamic>;
  return list.map((e) => datalist.formjson(e)).toList();
}
