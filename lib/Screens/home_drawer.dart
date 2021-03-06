import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:lol2/Screens/to_do_app.dart';
import 'package:lol2/screens/cats_pages.dart';
import 'package:lol2/theme/theme_provider.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher_string.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  bool openDrawer = false;
  bool cats = false;
  bool _themeProvder = false;
  @override
  Widget build(BuildContext context) {
    ThemeProvider themeProvider = Provider.of<ThemeProvider>(context);
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Theme.of(context).appBarTheme.backgroundColor,
          centerTitle: true,
          title: Text(" To Do App"),
          titleTextStyle: Theme.of(context).textTheme.headline1,
          leading: Builder(
            builder: (context) => IconButton(
              icon: Icon(FontAwesomeIcons.ellipsis),
              onPressed: () => Scaffold.of(context).openDrawer(),
            ),
          ),
          actions: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: GestureDetector(
                child: Icon(Icons.pets),
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: ((context) => CatsPage())));
                },
              ),
            ),
          ],
        ),
        drawer: Drawer(
          child: ListView(
            children: [
              MyProfile(),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    RichText(
                      text: PhoneNumber(),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 10),
                      child: MyEmail(),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 10),
                      child: MySocialPage(),
                    ),
                    Row(
                      children: [
                        Switch(
                            value: _themeProvder,
                            activeColor: Theme.of(context).primaryColor,
                            onChanged: (changer) {
                              _themeProvder = !_themeProvder;
                              Provider.of<ThemeProvider>(context,
                                  listen: false);
                              themeProvider.swapTheme();
                            }),
                        _themeProvder
                            ? Text("Switch on light mode",
                                style: Theme.of(context).textTheme.headline3)
                            : Text("Switch on dark mode",
                                style: Theme.of(context).textTheme.headline3),
                      ],
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
        body: ToDoApp());
  }

  Widget InsideDrawer() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          alignment: Alignment.centerRight,
          width: 150,
          child: Text(
            "Magdalena Tatar",
            style: TextStyle(fontSize: 20, color: Colors.white),
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
          ),
        ),
        Container(
          alignment: Alignment.centerRight,
          width: 150,
          child: Text(
            "",
            style: TextStyle(fontSize: 12, color: Colors.white38),
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
          ),
        ),
      ],
    );
  }

  Widget MyProfile() {
    return DrawerHeader(
      decoration: BoxDecoration(color: Theme.of(context).primaryColor),
      child: Stack(
        children: [
          Row(
            children: [
              Padding(
                padding: const EdgeInsets.only(right: 8.0),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: CircleAvatar(
                    child: ClipRRect(
                      child: Image.asset('assets/profilowe.jpg'),
                      borderRadius: BorderRadius.circular(40.0),
                    ),
                    radius: 50,
                    backgroundColor: Colors.amber,
                  ),
                ),
              ),
              // ignore: unnecessary_const
              Center(
                child: InsideDrawer(),
              ),
            ],
          ),
        ],
      ),
    );
  }

  PhoneNumber() {
    return TextSpan(
      children: [
        WidgetSpan(
          child: Icon(Icons.phone_android),
        ),
        TextSpan(
            text: "  791 - 477 - 439",
            recognizer: TapGestureRecognizer()..onTap = launchPhoneNumber,
            style: Theme.of(context).textTheme.headline2),
      ],
    );
  }

  Widget MyEmail() {
    return RichText(
      text: TextSpan(
        children: [
          WidgetSpan(
            child: Icon(
              Icons.email,
            ),
          ),
          TextSpan(
              text: "  Email",
              recognizer: TapGestureRecognizer()..onTap = launchEmail,
              style: Theme.of(context).textTheme.headline2),
        ],
      ),
    );
  }

  Widget MySocialPage() {
    return RichText(
      text: TextSpan(
          text: "My Social Page",
          recognizer: TapGestureRecognizer()..onTap = launchSocialPage,
          style: Theme.of(context).textTheme.headline2),
    );
  }

  Future launchEmail() async {
    const toEmail = "tatar.magdalena@wp.pl";
    const subject = "Good morning";
    const body = "Hello My Friends!";
    final email =
        "mailto:$toEmail?subject=${Uri.encodeFull(subject)}&body=${Uri.encodeFull(body)}";
    await launchUrlString(email);
  }

  void launchPhoneNumber() async {
    const phoneNumber = "+48791477439";

    await launchUrlString("tel:$phoneNumber");
  }
}

Future launchSocialPage() async {
  const url =
      'https://www.youtube.com/watch?v=dQw4w9WgXcQ&ab_channel=RickAstley';

  if (await canLaunchUrlString(url)) {
    await launchUrlString(url);
  } else {
    throw 'Could not launch $url';
  }
}
