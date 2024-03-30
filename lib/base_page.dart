import 'package:flutter/material.dart';
import 'films_page.dart';
import 'home_page.dart';
import 'comics_page.dart';
import 'series_page.dart';
import 'search_page.dart';

class BasePage extends StatefulWidget {
  static final GlobalKey<_BasePageState> basePageKey = GlobalKey<_BasePageState>();

  BasePage() : super(key: basePageKey);

  @override
  _BasePageState createState() => _BasePageState();
}

class _BasePageState extends State<BasePage> {
  int _selectedIndex = 0;

  final List<Widget> _widgetOptions = [
    HomePage(),
    ComicsPage(),
    SeriesPage(),
    FilmsPage(),
    SearchPage(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  // Méthode publique pour permettre le changement d'index depuis l'extérieur
  void setIndex(int index) {
    _onItemTapped(index);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFF15232E),
      ),
      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: <BottomNavigationBarItem>[
          _buildNavigationBarItem('Accueil', 'images/navbar_home.png', 0),
          _buildNavigationBarItem('Comics', 'images/navbar_comics.png', 1),
          _buildNavigationBarItem('Séries', 'images/navbar_series.png', 2),
          _buildNavigationBarItem('Films', 'images/navbar_movies.png', 3),
          _buildNavigationBarItem('Recherche', 'images/navbar_search.png', 4),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.blue,
        onTap: _onItemTapped,
      ),
    );
  }

  BottomNavigationBarItem _buildNavigationBarItem(String label, String imagePath, int index) {
    bool isSelected = _selectedIndex == index;
    return BottomNavigationBarItem(
      icon: ColorFiltered(
        colorFilter: isSelected
            ? const ColorFilter.mode(Colors.blue, BlendMode.srcIn)
            : const ColorFilter.mode(Colors.grey, BlendMode.srcIn),
        child: Image.asset(imagePath, height: 24),
      ),
      label: label,
    );
  }
}
