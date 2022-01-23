import 'package:flutter/material.dart';
import 'package:todoapp/Widgets/text_widget.dart';

class MyHomePage extends StatelessWidget {
  MyHomePage({Key? key}) : super(key: key);

  List<String> my_tasks = [
    "1",
    "2",
    "3",
    "4",
    "5",
    "6",
  ];

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
      body: ListView(
        //ListView - beztresowe wychowanie
        children: [
          // Center jest stricte rodzicem i każe robić dokładnie co chcemy
          Center(
            child: Container(
              child: TextFormField(),
              width: MediaQuery.of(context).size.width - 12,
              height: 100.0,
              color: Colors.purple[200],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: ListView.builder(
              shrinkWrap: true,
              itemCount: my_tasks.length,
              itemBuilder: (context, index) {
                return mytask(index);
              },
            ),
          )
        ],
      ),
    );
  }

  Widget mytask(int index) {
    bool ischecked = false;
    return Dismissible(
      key: UniqueKey(),
      // onDismissed: () {},
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Checkbox(value: ischecked, onChanged: (ischecked) {}),
              MyTextWidget(
                text: my_tasks[index].toString(),
                color: Colors.black,
                size: 15.0,
              ),
            ],
          ),
          Divider(
            color: Colors.purple,
            thickness: 2.0,
          )
        ],
      ),
    );
  }
}
