import 'dart:convert';
import 'package:flutter/material.dart';
import 'comic_card.dart';
import 'models/comic.dart'; // Ajustez le chemin vers où votre classe Comic est définie
import 'comic_detail_page.dart'; // Assurez-vous d'importer ComicDetailPage
import 'config.dart';
import 'package:http/http.dart' as http;

class ComicsPage extends StatefulWidget {
  @override
  _ComicsPageState createState() => _ComicsPageState();
}

class _ComicsPageState extends State<ComicsPage> {
  List<Comic> comics = [];
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    fetchComics();
  }

  Future<void> fetchComics() async {
    final String apiKey = Config.comicVineApiKey;
    final String comicsEndpoint = 'issues';
    final String apiUrl = 'https://comicvine.gamespot.com/api/$comicsEndpoint?api_key=$apiKey&format=json';

    try {
      final response = await http.get(Uri.parse(apiUrl));

      if (response.statusCode == 200) {
        final List<dynamic> comicData = json.decode(response.body)['results'];
        final List<Comic> comics = comicData.map((comicJson) => Comic.fromJson(comicJson)).toList();

        setState(() {
          this.comics = comics;
          isLoading = false;
        });
      } else {
        print('Erreur lors de la récupération des comics: ${response.statusCode}');
        setState(() {
          isLoading = false;
        });
      }
    } catch (e) {
      print('Erreur lors de la récupération des comics: $e');
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
              ...comics.map((comic) {
                return GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => ComicDetailPage(comic: comic, selectedCategory: 'histoire',)),
                    );
                  },
                  child: ComicCard(comic: comic, rank: comics.indexOf(comic) + 1),
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
