import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class MyTextDecoration extends StatelessWidget {
  String? text;
  bool? checkbox;
  TextOverflow? overflow;

  MyTextDecoration({
    this.text,
    this.checkbox,
  });
  @override
  Widget build(BuildContext context) {
    return Text(
      text!,
      overflow: TextOverflow.ellipsis,
      softWrap: true,
      maxLines: 2,
      style: TextStyle(
          fontFamily: GoogleFonts.poppins().fontFamily,
          fontWeight: FontWeight.w600,
          overflow: TextOverflow.ellipsis,
          fontSize: checkbox == true ? 14 : 15,
          color: checkbox == true ? Colors.grey : Colors.black87,
          decoration: checkbox == true
              ? TextDecoration.lineThrough
              : TextDecoration.none),
    );
  }
}
