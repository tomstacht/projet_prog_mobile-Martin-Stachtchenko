import 'dart:convert';

import 'package:flutter/material.dart';
import 'comic_card.dart';
import 'models/comic.dart'; // Ajustez le chemin vers où votre classe Comic est définie
import 'comic_detail_page.dart'; // Assurez-vous d'importer ComicDetailPage
import 'config.dart';
import 'package:http/http.dart' as http;

class ComicsPage extends StatelessWidget {
  final List<Comic> fromJson = List.generate(10, (index) => Comic.fromJson());

  @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color(0xFF15232E),
      child: SingleChildScrollView(
        child: Column(
          children: [
            _buildHeader(),
            ...fromJson.map((comic) {
              // Utilisez GestureDetector ou InkWell pour envelopper ComicCard
              return GestureDetector(
                onTap: () {
                  // Navigation vers ComicDetailPage avec le comic cliqué
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => ComicDetailPage(comic: comic, selectedCategory: 'histoire',)),
                  );
                },
                child: ComicCard(comic: comic, rank: 1),
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

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    throw UnimplementedError();
  }

