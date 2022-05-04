import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lol2/theme/MyTextDecoration.dart';
import 'package:lol2/screens/cats_pages.dart';

class ToDoApp extends StatefulWidget {
  ToDoApp({Key? key}) : super(key: key);

  @override
  State<ToDoApp> createState() => _ToDoAppState();
}

class _ToDoAppState extends State<ToDoApp> with SingleTickerProviderStateMixin {
  AnimationController? _animationController;
  TextEditingController _controller = TextEditingController();
  List<Map> my_task = [];
  bool cats = false;

  @override
  void dispose() {
    _animationController?.dispose();
    _animationController?.forward();
    super.dispose();
  }

  @override
  void initState() {
    _animationController =
        AnimationController(vsync: this, duration: Duration(milliseconds: 500));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        body: cats
            ? CatsPage()
            : Stack(children: [
                (Column(
                  children: [
                    Material(
                      elevation: 10,
                      shadowColor: Colors.black54,
                      child: TextFormField(
                        style: TextStyle(
                          fontFamily: GoogleFonts.poppins().fontFamily,
                        ),
                        controller: _controller,
                        keyboardType: TextInputType.text,
                        minLines: 1,
                        maxLines: 4,
                        decoration: InputDecoration(
                          prefixIcon: adding(
                            icon: Icon(FontAwesomeIcons.plus),
                            iconSize: 20,
                          ),
                          isDense: true,
                          contentPadding: EdgeInsets.all(10),
                          filled: true,
                          fillColor:
                              Theme.of(context).primaryColor.withOpacity(0.1),
                          focusedBorder: loginBorder(),
                          enabledBorder: loginBorder(),
                          errorBorder: loginBorder(),
                          focusedErrorBorder: loginBorder(),
                        ),
                      ),
                    ),
                    Expanded(
                        child: ListView.builder(
                            shrinkWrap: true,
                            itemCount: my_task.length,
                            itemBuilder: ((context, index) => myTask(index)))),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: adding(
                          icon: Icon(FontAwesomeIcons.circlePlus),
                          iconSize: 50),
                    )
                  ],
                )),
              ]),
      ),
    );
  }

  IconButton adding({icon, required double iconSize}) {
    return IconButton(
      icon: icon!,
      iconSize: iconSize,
      color: Theme.of(context).secondaryHeaderColor,
      onPressed: () {
        Map newMap = {};
        newMap["Checkbox"] = false;
        newMap["Text"] = _controller.text;

        setState(() {
          if (_controller.text != "" &&
              _controller.text != " " &&
              _controller.text != "  ") {
            my_task.add(newMap);
            _controller.clear();
          } else {
            return null;
          }
        });
      },
    );
  }

  Widget myTask(int index) {
    final item = my_task[index]["Text"];
    return Dismissible(
      key: UniqueKey(),
      onDismissed: (kierunek) {
        setState(() {
          if (kierunek == DismissDirection.endToStart) my_task.removeAt(index);
        });
        ScaffoldMessenger.of(context)
            .showSnackBar(SnackBar(content: Text("$item dismissed")));
      },
      child: Column(
        children: [
          Row(children: [
            Expanded(
              flex: 1,
              child: Checkbox(
                  fillColor:
                      MaterialStateProperty.all(Theme.of(context).primaryColor),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10))),
                  value: my_task[index].values.elementAt(0),
                  onChanged: (sprawdza) {
                    setState(() {
                      bool sprawdza = my_task[index].values.elementAt(0);
                      my_task[index]["Checkbox"] = !sprawdza;
                    });
                  }),
            ),
            Expanded(
              flex: 9,
              child: MyTextDecoration(
                text: my_task[index].values.elementAt(1).toString(),
                checkbox: my_task[index]["Checkbox"],
              ),
            ),
          ]),
          Divider(
            indent: 10,
            endIndent: 10,
            color: Theme.of(context).secondaryHeaderColor,
            thickness: 0.5,
          )
        ],
      ),
    );
  }

  loginBorder() {
    return OutlineInputBorder(
      borderSide:
          BorderSide(color: Theme.of(context).primaryColor.withOpacity(0.1)),
      borderRadius: BorderRadius.only(
        bottomLeft: Radius.circular(10),
        bottomRight: Radius.circular(10),
      ),
    );
  }
}
