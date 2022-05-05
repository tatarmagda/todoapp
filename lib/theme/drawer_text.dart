import 'package:flutter/material.dart';

class DrawerText extends StatelessWidget {
  String? text;
  double? fontSize;
  Color? color;
  FontWeight? fontWeight;
  DrawerText({this.text, this.fontSize, this.color, this.fontWeight});
  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.bottomRight,
      width: 150,
      child: Text(
        text!,
        textAlign: TextAlign.end,
        style: TextStyle(
            fontSize: fontSize!, color: color!, fontWeight: fontWeight),
        maxLines: 2,
        overflow: TextOverflow.ellipsis,
      ),
    );
  }
}
