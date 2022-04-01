import 'package:flutter/material.dart';
import 'package:todoapp/Widgets/text_widget.dart';
import 'package:todoapp/screens.dart/cats_pages.dart';

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage>
    with SingleTickerProviderStateMixin {
  AnimationController? _animationController;
  List<Map> my_tasks = [];

  @override
  void initState() {
    _animationController = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 150),
    );
    super.initState();
  }

  @override
  void disposed() {
    _animationController?.dispose();
    _animationController?.forward();
    super.dispose();
  }

  TextEditingController controller = TextEditingController();
  String my_imput = "";
  var jakaszmienna = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        leading: GestureDetector(
          child: Icon(Icons.pets),
          onTap: () {
            setState(() {
              jakaszmienna = !jakaszmienna;
            });
          },
        ),

        title: MyTextWidget(
          text: "todoapp",
          color: Colors.white54,
        ),
        //actions - dodaje więcej (tak jak plusik) wszytsko po prawej stronie w appbarze
        actions: [
          my_add_button(),
        ],

        // (){} - pusta funkcja
      ),
      body: jakaszmienna
          ? CatsPage()
          : ListView(
              //ListView - beztresowe wychowanie
              children: [
                // Center jest stricte rodzicem i każe robić dokładnie co chcemy
                Center(
                  child: Container(
                    child: TextFormField(
                      // onChanged: (string) {
                      //   setState(() {
                      //     my_imput = string;
                      //     my_tasks.add(my_imput);
                      //   });
                      // },
                      controller: controller,
                      keyboardType: TextInputType.text,
                      minLines: 1,
                      maxLines: 5,
                      autofocus: true,
                      decoration: InputDecoration(
                        prefixIcon: my_add_button(),
                        border: InputBorder.none,
                      ),
                    ),
                    width: MediaQuery.of(context).size.width - 12,
                    // height: 100.0,
                    color: Color.fromARGB(255, 106, 179, 175),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ListView.builder(
                    physics: NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemCount: my_tasks.length,
                    itemBuilder: (context, index) {
                      return mytask(index);
                    },
                  ),
                ),
              ],
            ),
    );
  }

  IconButton my_add_button() {
    return IconButton(
      icon: Icon(Icons.add),
      onPressed: () {
        Map new_Map = {};
        new_Map["Checkboks"] = false;
        new_Map["Tekst"] = controller.text;
        setState(() {
          my_tasks.add(new_Map);
          controller.clear();
        });
      },
    );
  }

  Widget mytask(int index) {
    return Dismissible(
      key: UniqueKey(),
      onDismissed: (kierunek) {
        if (kierunek == DismissDirection.startToEnd ||
            kierunek == DismissDirection.endToStart) my_tasks.removeAt(index);
      },
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Checkbox(
                  value: my_tasks[index].values.elementAt(0),
                  onChanged: (sprawdza) {
                    setState(() {
                      bool sprawdza = my_tasks[index].values.elementAt(0);
                      my_tasks[index]["Checkboks"] = !sprawdza;
                    });
                  }),
              MyTextWidget(
                text: my_tasks[index].values.elementAt(1).toString(),
                color: Colors.black,
                size: 15.0,
                checkbox: my_tasks[index]["Checkboks"],
              ),
            ],
          ),
          const Divider(
            color: Color.fromARGB(255, 106, 179, 175),
            thickness: 2.0,
          )
        ],
      ),
    );
  }
}
