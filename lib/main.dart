import 'package:expenses/pages/HomePage.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: const Color.fromRGBO(40, 40, 43, 1.0),
        accentColor: const Color.fromRGBO(73, 73, 75, 1),
        drawerTheme: const DrawerThemeData(
            backgroundColor: Color.fromRGBO(40, 40, 43, 1.0)),
        appBarTheme: const AppBarTheme(
          backgroundColor: Color.fromRGBO(40, 40, 43, 1.0),
        ),
        useMaterial3: true,
      ),
      home: const HomePage(),
    );
  }
}
