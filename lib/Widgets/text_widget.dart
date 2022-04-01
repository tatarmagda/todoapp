import 'package:flutter/material.dart';

class MyTextWidget extends StatelessWidget {
  String? text;
  Color? color;
  double? size;
  TextDecoration? decoration;
  bool? checkbox;

  MyTextWidget(
      {this.text, this.color, this.size, this.decoration, this.checkbox});

  @override
  Widget build(BuildContext context) {
    return Text(text!,
        style: TextStyle(
          color: color,
          fontWeight: FontWeight.bold,
          fontSize: size,
          decoration: checkbox == true
              ? TextDecoration.lineThrough
              : TextDecoration.none,
        ));
  }
}
