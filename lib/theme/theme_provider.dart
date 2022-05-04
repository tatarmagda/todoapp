import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ThemeProvider extends ChangeNotifier {
  late ThemeData _selectedTheme;

  ThemeData light = ThemeData.light().copyWith(backgroundColor: Colors.white);

  ThemeData dark = ThemeData.dark().copyWith(backgroundColor: Colors.black);

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
