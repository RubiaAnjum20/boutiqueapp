import 'package:boutiqueapp/Utils/app_theme.dart';
import 'package:flutter/material.dart';

class ThemeProvider with ChangeNotifier{
  ThemeData _themeData = AppThemes.lightTheme;

 ThemeData get themeData => _themeData;
// ThemeData themeData;

  set themeData(ThemeData themeData){
    _themeData = themeData;
    notifyListeners();
  }

  void toggleTheme(){
    if(_themeData == AppThemes.lightTheme){
      themeData = AppThemes.darkTheme;
    }
    else{
      themeData = AppThemes.lightTheme;
    }
  }
}