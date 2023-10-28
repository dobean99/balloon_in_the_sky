import 'package:balloon_in_the_sky/config/assets/assets.dart';
import 'package:flutter/material.dart';

class ThemeProvider extends ChangeNotifier {
  String themeBackgroundImage = PngAssets.backgroundImage;
  String get backgroundImage => themeBackgroundImage;
  void changeThemeBackgroundImage(String newBackgroundImage) {
    themeBackgroundImage = newBackgroundImage;
    notifyListeners();
  }
}
