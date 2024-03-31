import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'config.dart';
import 'models/comic.dart';
import 'horizontal_items_grid.dart';
import 'section.dart';
import 'comic_card.dart';
import 'comic_detail_page.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
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
    final String apiUrl =
        'https://comicvine.gamespot.com/api/$comicsEndpoint?api_key=$apiKey&format=json';

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
      appBar: AppBar(
        title: Text('Mon App Comics'),
      ),
      body: isLoading
          ? Center(child: CircularProgressIndicator())
          : SingleChildScrollView(
        child: Column(
          children: [
            Section(
              title: 'Comics Populaires',
              child: HorizontalItemGrid<Comic>(
                items: comics,
                itemBuilder: (comic) => ComicCard(comic: comic, rank: comics.indexOf(comic) + 1), // Ici, le rank est défini
              ),
            ),
          ],
        ),
      ),
    );
  }
}
