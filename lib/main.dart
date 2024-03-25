import 'package:flutter/material.dart';
import 'package:projet_prog_mobile/home_page.dart';
//import 'services/api_service.dart';  // Importing the ApiService


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
      home: HomePage(),
    );
  }
}