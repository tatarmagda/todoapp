import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ThemeProvider extends ChangeNotifier {
  late ThemeData _selectedTheme;

  ThemeData light = ThemeData.light().copyWith(
    primaryColor: Colors.teal,
    secondaryHeaderColor: const Color.fromARGB(234, 218, 181, 70),
    accentColor: Colors.black,
    iconTheme: const IconThemeData(color: Colors.black),
    shadowColor: Colors.teal.withOpacity(0.2),
    backgroundColor: const Color.fromARGB(216, 253, 250, 234),
    appBarTheme: const AppBarTheme(backgroundColor: Colors.teal),
    textTheme: const TextTheme(
      headline1: TextStyle(
          color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold),
      headline2: TextStyle(
          color: Color.fromARGB(234, 218, 181, 70),
          fontSize: 16,
          fontWeight: FontWeight.bold),
      headline3: TextStyle(
          color: Colors.black, fontSize: 16, fontWeight: FontWeight.bold),
    ),
  );

  ThemeData dark = ThemeData.dark().copyWith(
    primaryColor: Colors.teal,
    secondaryHeaderColor: const Color.fromARGB(234, 218, 181, 70),
    accentColor: Colors.white,
    iconTheme: const IconThemeData(color: Colors.white),
    shadowColor: Colors.teal.withOpacity(0.2),
    backgroundColor: Colors.black.withOpacity(0.9),
    appBarTheme: AppBarTheme(
      backgroundColor: Colors.black.withOpacity(0.9),
    ),
    textTheme: const TextTheme(
      headline1: TextStyle(
          color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold),
      headline2: TextStyle(
          color: Color.fromARGB(234, 218, 181, 70),
          fontSize: 16,
          fontWeight: FontWeight.bold),
      headline3: TextStyle(
          color: Colors.white, fontSize: 16, fontWeight: FontWeight.bold),
    ),
  );

  ThemeProvider({bool isDarkMode = false}) {
    _selectedTheme = isDarkMode ? dark : light;
  }
  Future<void> swapTheme() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    if (_selectedTheme == dark) {
      _selectedTheme = light;
      prefs.setBool("isDarkTheme", false);
    } else {
      _selectedTheme = dark;
      prefs.setBool("isDarkTheme", true);
    }
    notifyListeners();
  }

  ThemeData get getTheme => _selectedTheme;
}
