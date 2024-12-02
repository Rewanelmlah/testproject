import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:testing2/features/splash/splash_screen.dart';
import 'core/theme_manager.dart'; // استيراد مدير الثيم

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final isDarkMode =
      await ThemeManager.getSavedTheme(); // استرجاع الثيم المحفوظ

  runApp(MyApp(isDarkMode: isDarkMode));
}

class MyApp extends StatelessWidget {
  final bool isDarkMode;

  const MyApp({Key? key, required this.isDarkMode}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(360, 690),
      minTextAdapt: true,
      builder: (context, child) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          theme: isDarkMode ? ThemeManager.darkTheme : ThemeManager.lightTheme,
          home: const SplashScreen(), // ابدأ بـ Splash Screen
        );
      },
    );
  }
}
