import 'package:flutter/material.dart';

class AppColors {
  static const primaryColor1 = Color.fromARGB(255, 50, 199, 99);
  static const primaryColor2 = Color.fromARGB(255, 56, 118, 253);

  static const secundaryColor1 = Color.fromARGB(255, 98, 142, 255);
  static const secundaryColor2 = Color(0xFF9DCEFF);

  static const whiteColor = Color(0xFFFFFFFF);
  static const blackColor = Color(0xFF1D1617);
  static const grayColor = Color(0xFF7B6F72);
  static const lightGrayColor = Color(0xFFF7F8F8);
  static const midGrayColor = Color(0xFFADA4a5);

  static List<Color> get primaryG => [primaryColor1, primaryColor2];
  static List<Color> get secondaryG => [secundaryColor1, secundaryColor2];
}
