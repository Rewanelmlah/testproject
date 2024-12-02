import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ThemeManager {
  // تعريف الثيمات
  static final ThemeData lightTheme = ThemeData(
    brightness: Brightness.light,
    primarySwatch: Colors.blue,
    scaffoldBackgroundColor: Colors.white,
  );

  static final ThemeData darkTheme = ThemeData(
    brightness: Brightness.dark,
    primarySwatch: Colors.blue,
    scaffoldBackgroundColor: Colors.black,
  );

  // ميثود لتبديل الثيم
  static Future<bool> toggleTheme(bool isDarkMode) async {
    final prefs = await SharedPreferences.getInstance();
    final newMode = !isDarkMode; // عكس الوضع الحالي
    await prefs.setBool('isDarkMode', newMode); // حفظ الوضع الجديد
    return newMode; // إرجاع الوضع الجديد
  }

  // ميثود لاسترجاع الوضع الحالي من SharedPreferences
  static Future<bool> getSavedTheme() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getBool('isDarkMode') ?? false; // الوضع الافتراضي: Light
  }
}
