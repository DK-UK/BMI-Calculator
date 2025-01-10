import 'package:flutter/material.dart';
import 'package:bmi_calculator/SplashScreen.dart';


void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        
      ),
      home : Splashscreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}
