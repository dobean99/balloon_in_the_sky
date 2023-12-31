import 'package:flutter/material.dart';

class AppColors {
  static const Color primaryColor = Color(0xFF232323);
  static const Color howlingPink = Color(0xFFE20E50);

  static const Color doveGrey = Color(0xFF6d6d6d);
  static const Color blackColor = Colors.black;
  static const Color whiteColor = Colors.white;

  // static const Color seaGreen = Color(0xFF00FFD1);
  // static const Color artyClickOceanGreen = Color(0xFF00FF66);
  // static const Color freshGreen = Color(0xFF70D260);
  // static const Color brightYellowGreen = Color(0xFFADFF00);
  // static const Color butterflyBlue = Color(0xFF19A8FE);
  // static const Color lightBlue = Color(0xFF104AFB);
  // static const Color purple = Color(0xFF6631E3);
  // static const Color jasminePurple = Color(0xFF9C41F4);
  // static const Color vitaminC = Color(0xFFFF9900);
  // static const Color white = Color(0xFFFFFFFF);
  // static const Color lightSilver = Color(0xFFD9D9D9);
  // static const Color uniqueGrey = Color(0xFFC9C9C9);
  // static const Color carbonGrey = Color(0xFF625D5D);
  // static const Color tin = Color(0xFF909090);
  // static const Color blackOut = Color(0xFF222222);
  // static const Color backgroundColor = Color(0xFF000000);
  // static const Color forgedSteel = Color(0xFF5A5A5A);

  static const Color lightTextColor = Color.fromRGBO(122, 134, 154, 1);

  static Shader linearGradient = const LinearGradient(
    colors: <Color>[blackColor, primaryColor, doveGrey],
  ).createShader(const Rect.fromLTWH(0.0, 0.0, 0.0, 0.0));

  static const LinearGradient blackToGrey = LinearGradient(
    colors: <Color>[blackColor, primaryColor, doveGrey],
  );
}
