// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class RoundButton extends StatelessWidget {
  final String title;
  final bool loading;
  final VoidCallback onpress;
  const RoundButton({
    Key? key,
    required this.title,
    this.loading = true,
    required this.onpress,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onpress,
      child: Container(
        height: 50,
        width: 350,
        alignment: Alignment.center,
        decoration: BoxDecoration(color: Colors.blue),
        child: loading
            ? CircularProgressIndicator(
                color: Colors.amber,
              )
            : Text(
                title,
                style: TextStyle(color: Colors.white),
              ),
      ),
    );
  }
}
