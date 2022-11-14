import 'package:flutter/material.dart';
import 'package:final_project_ss_app/pages/loading_page.dart';
import 'network/api_request.dart';

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
          titleLarge: TextStyle(
              fontSize: 25, color: Colors.black, fontWeight: FontWeight.bold),
          labelMedium: TextStyle(
            fontSize: 15,
            color: Colors.black,
          ),
          headlineMedium: TextStyle(
              fontSize: 12, color: Colors.black, fontWeight: FontWeight.bold),
        ),
      ),
      home: const SplashScreen(),
    );
  }
}
