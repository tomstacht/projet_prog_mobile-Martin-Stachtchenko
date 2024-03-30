import 'package:flutter/material.dart';
import 'film_card.dart';
import 'film.dart'; // Adjust the path to where your Comic class is defined
import 'film_detail_page.dart'; // Adjust the path to where your Comic class is defined


class FilmsPage extends StatelessWidget {
  final List<Film> mockFilms = List.generate(10, (index) => Film.mock());

  @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color(0xFF15232E),
      child: SingleChildScrollView(
        child: Column(
          children: [
            _buildHeader(),
            ...mockFilms.map((film) {
              // Utilisez GestureDetector ou InkWell pour envelopper ComicCard
              return GestureDetector(
                onTap: () {
                  // Navigation vers ComicDetailPage avec le comic cliqué
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => FilmDetailPage(film: film, selectedCategory: 'histoire',)),
                  );
                },
                child: FilmCard(film: film, rank: 1),
              );
            }).toList(),
          ],
        ),
      ),
    );
  }


  Widget _buildHeader() {
    return const Padding(
      padding: EdgeInsets.only(left: 5, top: 10, bottom: 20),
      child: Text(
        'Films les plus populaires',
        style: TextStyle(
          fontWeight: FontWeight.bold,
          color: Colors.white,
          fontSize: 30,
        ),
      ),
    );
  }
}
