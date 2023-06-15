import 'package:botanik_bahcem/features/home/presentation/widgets/theme_shared_prefrences.dart';
import 'package:flutter/material.dart';

class ThemeModal extends ChangeNotifier {
late bool _isDark;
late ThemeSharedPrefrences themeSharedPrefrences;
bool get isDark => _isDark;

ThemeModal(){
  _isDark = false;
  themeSharedPrefrences = ThemeSharedPrefrences();
  getThemePrefrences();
  }

  set isDark(bool value){
    _isDark = value;
    themeSharedPrefrences.setTheme(value);
    notifyListeners();
  }


  @override
  Widget build(BuildContext context) {
    return Container();
  }

  getThemePrefrences() async{
    _isDark = await themeSharedPrefrences.getTheme();
    notifyListeners();
  }
}