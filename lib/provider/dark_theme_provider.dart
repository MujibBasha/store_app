import 'package:flutter/material.dart';
import 'package:store/models/dark_theme_preferences.dart';


class DarkThemeProvider extends ChangeNotifier{
  DarkThemePreferences darkThemePreferences=DarkThemePreferences();
  bool _darkTheme=false;

  // ignore: unnecessary_getters_setters
  bool get darkTheme=>_darkTheme;

   // ignore: unnecessary_getters_setters
   set darkTheme(bool value){
    _darkTheme=value;
    darkThemePreferences.setDarkTheme(value);
    notifyListeners();
  }
}