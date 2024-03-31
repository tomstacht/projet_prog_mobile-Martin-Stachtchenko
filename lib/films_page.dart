import 'dart:convert';
import 'package:flutter/material.dart';
import 'film_card.dart';
import 'models/film.dart'; // Ajustez le chemin vers où votre classe Film est définie
import 'film_detail_page.dart'; // Ajustez le chemin vers où votre classe FilmDetailPage est définie
import 'config.dart';
import 'package:http/http.dart' as http;

class FilmsPage extends StatefulWidget {
  @override
  _FilmsPageState createState() => _FilmsPageState();
}

class _FilmsPageState extends State<FilmsPage> {
  List<Film> films = [];
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    fetchFilms();
  }

  Future<void> fetchFilms() async {
    final String apiKey = Config.comicVineApiKey;
    final String filmsEndpoint = 'movies';
    final String apiUrl = 'https://comicvine.gamespot.com/api/$filmsEndpoint?api_key=$apiKey&format=json';

    try {
      final response = await http.get(Uri.parse(apiUrl));

      if (response.statusCode == 200) {
        final List<dynamic> filmData = json.decode(response.body)['results'];
        final List<Film> films = filmData.map((filmJson) => Film.fromJson(filmJson)).toList();

        setState(() {
          this.films = films;
          isLoading = false;
        });
      } else {
        print('Erreur lors de la récupération des films: ${response.statusCode}');
        setState(() {
          isLoading = false;
        });
      }
    } catch (e) {
      print('Erreur lors de la récupération des films: $e');
      setState(() {
        isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: const Color(0xFF15232E),
        child: isLoading
            ? Center(child: CircularProgressIndicator())
            : SingleChildScrollView(
          child: Column(
            children: [
              _buildHeader(),
              ...films.map((film) {
                return GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => FilmDetailPage(film: film, selectedCategory: 'personnages',)),
                    );
                  },
                  child: FilmCard(film: film, rank: films.indexOf(film) + 1),
                );
              }).toList(),
            ],
          ),
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
