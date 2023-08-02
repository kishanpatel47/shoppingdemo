import 'package:flutter/material.dart';

class AnotherScreen extends StatelessWidget {
  final List<String> arrayList;

  const AnotherScreen({Key? key, required this.arrayList}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Array List Screen'),
      ),
      body: ListView.builder(
        itemCount: arrayList.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(arrayList[index]),
          );
        },
      ),
    );
  }
}
