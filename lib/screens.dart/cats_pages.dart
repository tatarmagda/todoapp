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
      child: Container(
        width: double.infinity,
        height: double.infinity,
        child: AnimatedAlign(
          alignment: selected ? Alignment.topRight : Alignment.bottomLeft,
          duration: const Duration(seconds: 1),
          curve: Curves.fastOutSlowIn,
          child: Image.asset(
            "assets/cat.png",
            height: 100,
            width: 100,
          ),
        ),
      ),
    );
  }
}
