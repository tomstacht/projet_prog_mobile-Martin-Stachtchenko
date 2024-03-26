import 'package:flutter/material.dart';
import 'home_page.dart'; // Ensure this file defines the HomePage widget properly
import 'comics_page.dart'; // Ensure this file defines the ComicsPage widget properly

class BasePage extends StatefulWidget {
  @override
  _BasePageState createState() => _BasePageState();
}

class _BasePageState extends State<BasePage> {
  int _selectedIndex = 0;

  // List of widgets to display for each bottom navigation bar item
  final List<Widget> _widgetOptions = [
    HomePage(),
    ComicsPage(),
    // Add more pages as needed
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFF15232E), // Set the AppBar background color here
      ),
      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Image.asset('images/navbar_home.png', height: 24),
            label: 'Accueil',
          ),
          BottomNavigationBarItem(
            icon: Image.asset('images/navbar_comics.png', height: 24),
            label: 'Comics',
          ),
          BottomNavigationBarItem(
            icon: Image.asset('images/navbar_series.png', height: 24),
            label: 'Séries',
          ),
          BottomNavigationBarItem(
            icon: Image.asset('images/navbar_movies.png', height: 24),
            label: 'Films',
          ),
          BottomNavigationBarItem(
            icon: Image.asset('images/navbar_search.png', height: 24),
            label: 'Recherche',
          ),
          // Add more items as needed
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.blue[800],
        unselectedItemColor: Colors.grey[800],
        onTap: _onItemTapped,
      ),
    );
  }
}