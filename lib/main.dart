import 'package:flutter/material.dart';
import 'package:islami_app/home_screen.dart';
import 'package:islami_app/tabs/quran/sura_content.dart';
import 'package:islami_app/theme_app.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Islami',
      routes: {
        HomeScreen.routeName: (_) => HomeScreen(),
        SuraContent.routeName:(_) => SuraContent(),
      },
      initialRoute: HomeScreen.routeName,
      theme: ThemeApp.lightThemeData,
      darkTheme: ThemeApp.darkThemeData,
      themeMode: ThemeMode.light,
    );
  }
}
