import 'package:flutter/material.dart';
import 'home_page.dart'; // Ensure this file defines the HomePage widget properly
import 'comics_page.dart'; // Ensure this file defines the ComicsPage widget properly
import 'series_page.dart'; // Ensure this file defines the ComicsPage widget properly

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
    SeriesPage(),
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
          _buildNavigationBarItem(
            'Accueil',
            'images/navbar_home.png',
            0,
          ),
          _buildNavigationBarItem(
            'Comics',
            'images/navbar_comics.png',
            1,
          ),
          _buildNavigationBarItem(
            'Séries',
            'images/navbar_series.png',
            2,
          ),
          _buildNavigationBarItem(
            'Films',
            'images/navbar_movies.png',
            3,
          ),
          _buildNavigationBarItem(
            'Recherche',
            'images/navbar_search.png',
            4,
          ),
          // Add more items as needed
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.blue, // Active item color
        onTap: _onItemTapped,
      ),
    );
  }

  BottomNavigationBarItem _buildNavigationBarItem(
      String label,
      String imagePath,
      int index,
      ) {
    bool isSelected = _selectedIndex == index;
    return BottomNavigationBarItem(
      icon: ColorFiltered(
        colorFilter: isSelected
            ? ColorFilter.mode(
          Colors.blue, // Change the color to blue when selected
          BlendMode.srcIn,
        )
            : ColorFilter.mode(
          Colors.grey, // Change the color to grey when not selected
          BlendMode.srcIn,
        ),
        child: Image.asset(
          imagePath,
          height: 24,
        ),
      ),
      label: label,
    );
  }
}
