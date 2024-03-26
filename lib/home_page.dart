import 'package:flutter/material.dart';
import 'horizontal_items_grid.dart';
import 'comic.dart';
import 'section.dart';

class HomePage extends StatelessWidget {
  final List<Comic> mockSeries = List.generate(10, (index) => Comic.mock());
  final List<Comic> mockComics = List.generate(10, (index) => Comic.mock());
  final List<Comic> mockFilms = List.generate(10, (index) => Comic.mock());

  @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color(0xFF15232E), // Set the background color
      child: SingleChildScrollView(
        child: Column(
          children: [
            _buildHeader(),
            Section(title: 'Séries populaires', child: HorizontalItemGrid(series: mockSeries)),
            Section(title: 'Comics populaires', child: HorizontalItemGrid(series: mockComics)),
            Section(title: 'Films populaires', child: HorizontalItemGrid(series: mockFilms)),
          ],
        ),
      ),
    );
  }

  Widget _buildHeader() {
    return Row(
      children: <Widget>[
        const Padding(
          padding: EdgeInsets.only(left: 10, top: 10),
          child: Text(
            'Bienvenue !',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 0, top: 10),
          child: Image.asset(
            'images/astronaut.png',
            height: 159,
            width: 121,
          ),
        ),
      ],
    );
  }
}
