import 'package:flutter/material.dart';
import 'base_page.dart'; // Assurez-vous que le chemin d'accès est correct

class Section extends StatelessWidget {
  final String title;
  final Widget child;

  const Section({super.key, required this.title, required this.child});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 20.0),
      decoration: BoxDecoration(
        color: const Color(0xFF1E3243),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        children: [
          SectionTitle(title: title),
          child,
        ],
      ),
    );
  }
}

class SectionTitle extends StatelessWidget {
  final String title;

  const SectionTitle({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 16.0),
      child: Row(
        children: [
          Container(
            margin: const EdgeInsets.only(right: 8.0),
            height: 10.0,
            width: 10.0,
            decoration: const BoxDecoration(
              color: Color(0xFFFF8100),
              shape: BoxShape.circle,
            ),
          ),
          Expanded(
            child: Text(
              title,
              style: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
          ),
          TextButton(
            onPressed: () {
              // Utilise la GlobalKey pour accéder à setIndex de BasePage
              if (title == "Comics populaires") {
                BasePage.basePageKey.currentState?.setIndex(1); // 1 pour l'index des Comics
              }
              else if (title == "Séries populaires") {
                BasePage.basePageKey.currentState?.setIndex(2); //
              }
              else if (title == "Films populaires") {
                BasePage.basePageKey.currentState?.setIndex(3); //
              }
              // Vous pouvez ajouter d'autres conditions ici pour d'autres sections
            },
            style: TextButton.styleFrom(
              backgroundColor: const Color(0xFF0F1921),
              padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15),
              ),
            ),
            child: const Text(
              'Voir plus',
              style: TextStyle(color: Colors.white),
            ),
          ),
        ],
      ),
    );
  }
}
