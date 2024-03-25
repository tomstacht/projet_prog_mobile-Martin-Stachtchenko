import 'package:flutter/material.dart';

class BasePage extends StatefulWidget {
  final String title;
  final Widget child; // Ajoutez la propriété child ici
  final List<Widget> pages;
  final int bottomNavIndex;

  const BasePage({
    Key? key,
    required this.title,
    required this.child,
    required this.pages,
    required this.bottomNavIndex,
  }) : super(key: key);

  @override
  _BasePageState createState() => _BasePageState();
}

class _BasePageState extends State<BasePage> {
  late PageController _pageController;

  @override
  void initState() {
    super.initState();
    _pageController = PageController(initialPage: widget.bottomNavIndex);
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  void _onItemTapped(int index) {
    _pageController.jumpToPage(index); // Changer jumpToPage pour animateToPage si une animation est souhaitée
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        backgroundColor: const Color(0xFF15232E),
      ),
      body: PageView(
        controller: _pageController,
        children: widget.pages,
        onPageChanged: (index) {
          if (index != widget.bottomNavIndex) {
            setState(() {
              // Mettre à jour l'index pour synchroniser avec le BottomNavigationBar
            });
          }
        },
      ),
      backgroundColor: const Color(0xFF15232E),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: widget.bottomNavIndex,
        onTap: _onItemTapped,
        items: [
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
        ],
        selectedItemColor: Colors.blue,
        unselectedItemColor: Colors.grey,
      ),
    );
  }
}
