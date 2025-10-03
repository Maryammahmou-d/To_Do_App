import 'package:flutter/material.dart';
import 'package:to_do_app/layout/home_layout.dart';
import 'package:to_do_app/stayle/app_theme.dart';

void main() {
  runApp(const ToDoApp());
}

class ToDoApp extends StatelessWidget {
  const ToDoApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: HomeLayout.routeName,
      routes: {
        HomeLayout.routeName: (context) => HomeLayout(),
      },
      debugShowCheckedModeBanner: false,
      themeMode: ThemeMode.light,
      theme: AppThemeing.lightMode,
      darkTheme: AppThemeing.darkTheme,
    );
  }
}
