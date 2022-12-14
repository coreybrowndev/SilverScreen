import 'package:flutter/material.dart';
import 'package:final_project_ss_app/pages/loading_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Silver Screen',
      theme: ThemeData(
        textTheme: const TextTheme(
          // Card Movie Title
          titleLarge: TextStyle(
              fontSize: 25, color: Colors.black, fontWeight: FontWeight.bold),
          // Card Release Date
          labelMedium: TextStyle(fontSize: 15, color: Colors.black),
          // Card Description
          bodySmall: TextStyle(
              fontSize: 12, color: Colors.black, fontWeight: FontWeight.bold),
          // Movie Lists Titles
          titleMedium: TextStyle(
            color: Colors.grey,
            fontSize: 16,
          ),
        ),
      ),
      home: const SplashScreen(),
    );
  }
}
