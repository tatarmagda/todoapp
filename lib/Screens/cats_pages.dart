import 'dart:math';

import 'package:flutter/material.dart';

class CatsPage extends StatefulWidget {
  const CatsPage({Key? key}) : super(key: key);

  @override
  State<CatsPage> createState() => _CatsPageState();
}

class _CatsPageState extends State<CatsPage> {
  bool selected = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        setState(() {
          selected = !selected;
        });
      },
      child: Scaffold(
        appBar: AppBar(
          title: Text("Press anywhere you want ;)"),
        ),
        body: Container(
          width: double.infinity,
          height: double.infinity,
          child: AnimatedAlign(
            alignment: selected ? Alignment.topRight : Alignment.bottomLeft,
            duration: Duration(seconds: numbersShuffle()),
            curve: Curves.fastOutSlowIn,
            child: Image.asset(
              "assets/cat.png",
              height: 200,
              width: 200,
            ),
          ),
        ),
      ),
    );
  }
}

numbersShuffle() {
  var rng = new Random();

  return rng.nextInt(7);
}
