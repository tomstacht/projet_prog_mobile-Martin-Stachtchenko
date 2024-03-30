import 'package:flutter/material.dart';
import 'serie_card.dart';
import 'serie.dart'; // Adjust the path to where your Comic class is defined
import 'serie_detail_page.dart'; // Assurez-vous d'importer ComicDetailPage


class SeriesPage extends StatelessWidget {
  final List<Serie> mockSeries = List.generate(10, (index) => Serie.mock());

  @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color(0xFF15232E),
      child: SingleChildScrollView(
        child: Column(
          children: [
            _buildHeader(),
            ...mockSeries.map((serie) {
              // Utilisez GestureDetector ou InkWell pour envelopper ComicCard
              return GestureDetector(
                onTap: () {
                  // Navigation vers ComicDetailPage avec le comic cliqué
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => SerieDetailPage(serie: serie, selectedCategory: 'histoire',)),
                  );
                },
                child: SerieCard(serie: serie, rank: 1),
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
        'Series les plus populaires',
        style: TextStyle(
          fontWeight: FontWeight.bold,
          color: Colors.white,
          fontSize: 30,
        ),
      ),
    );
  }
}
