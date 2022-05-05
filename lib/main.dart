import 'package:flutter/material.dart';
import 'package:lol2/Screens/home_drawer.dart';
import 'package:lol2/theme/theme_provider.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SharedPreferences prefs = await SharedPreferences.getInstance();
  return runApp(
    ChangeNotifierProvider(
      child: const MyApp(),
      create: (BuildContext context) =>
          ThemeProvider(isDarkMode: prefs.getBool('isDarkTheme') ?? false),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<ThemeProvider>(builder: (context, themeProvider, child) {
      return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: themeProvider.getTheme,
        home: const MyHomePage(),
      );
    });
  }
}
