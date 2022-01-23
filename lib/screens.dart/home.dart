import 'package:flutter/material.dart';
import 'package:todoapp/Widgets/text_widget.dart';

class MyHomePage extends StatelessWidget {
  MyHomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: MyTextWidget(
          text: "todoapp",
          color: Colors.white54,
        ),
        //actions - dodaje więcej (tak jak plusik) wszytsko po prawej stronie w appbarze
        actions: [
          IconButton(
              onPressed: () {
                print("nie działa");
              },
              icon: Icon(
                Icons.add,
              ))
        ],
        // (){} - pusta funkcja
      ),
      body: ListView(),
    );
  }
}
