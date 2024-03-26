import 'package:flutter/material.dart';
import 'comic_card.dart';
import 'package:projet_prog_mobile/comic.dart'; // Adjust the path to where your Comic class is defined


class ComicsPage extends StatelessWidget {
  final List<Comic> mockComics = List.generate(10, (index) => Comic.mock());

  @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color(0xFF15232E), // Set the background color
      child: SingleChildScrollView(
        child: Column(
          children: [
            _buildHeader(),
              ...mockComics.map((comic) => ComicCard(comic: comic, rank: 1)).toList(),
          ],
        ),
      ),
    );
  }


  Widget _buildHeader() {
    return Padding(
      padding: EdgeInsets.only(left: 5, top: 10, bottom: 20),
      child: Text(
        'Comics les plus populaires',
        style: TextStyle(
          fontWeight: FontWeight.bold,
          color: Colors.white,
          fontSize: 30,
        ),
      ),
    );
  }
}
