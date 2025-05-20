import 'package:flutter/material.dart';

class AppColors {
  static const Color primary = Color(0xFF3D5CFF);
  static const Color background = Color(0xFFF5F5F9);
  static const Color white = Color(0xFFFFFFFF);
  static const Color black = Color(0xFF000000);
  static const Color grey = Color(0xFF858597);
  static const Color lightGrey = Color(0xFFEEEEF0);
  static const Color darkGrey = Color(0xFF545454);
}

class AppTextStyles {
  static const TextStyle heading1 = TextStyle(
    fontSize: 22.0,
    fontWeight: FontWeight.bold,
    color: AppColors.black,
  );
  
  static const TextStyle heading2 = TextStyle(
    fontSize: 18.0,
    fontWeight: FontWeight.bold,
    color: AppColors.black,
  );
  
  static const TextStyle bodyText = TextStyle(
    fontSize: 14.0,
    color: AppColors.darkGrey,
  );
  
  static const TextStyle buttonText = TextStyle(
    fontSize: 16.0,
    fontWeight: FontWeight.w600,
    color: AppColors.white,
  );
}