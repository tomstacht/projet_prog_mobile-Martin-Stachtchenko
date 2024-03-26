import 'package:flutter/material.dart';
import 'base_page.dart'; // Make sure this import is correct

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Comic App',
      theme: ThemeData(
        visualDensity: VisualDensity.adaptivePlatformDensity,
        canvasColor: const Color(0xFF15232E), // Set your desired background color here
      ),
      home: BasePage(), // Use BasePage as the home widget
    );
  }
}
