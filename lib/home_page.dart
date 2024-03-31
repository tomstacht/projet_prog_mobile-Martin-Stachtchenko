import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'config.dart';
import 'models/comic.dart';
import 'comic_card.dart';
import 'comic_detail_page.dart';
import 'comics_page.dart';


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

        print(comics.length); // Add this line to print the length of comics

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
        title: Row(
          children: [
            Text(
              'Bienvenue !',
              style: TextStyle(color: Colors.white, fontSize: 50), // Augmentation de la taille du texte
            ),
            SizedBox(width: 10),
            Flexible(
              child: Image.asset(
                'images/astronaut.png', // Assurez-vous de placer votre image dans le dossier 'images' de votre projet
                fit: BoxFit.contain, // Ajustement de l'image pour s'adapter à la taille disponible
              ),
            ),
          ],
        ),
        backgroundColor: Color(0xFF15232E),
      ),
      backgroundColor: Color(0xFF15232E), // Ajout de la couleur de fond
      body: isLoading
          ? Center(child: CircularProgressIndicator())
          : SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Row(
                children: [
                  Container(
                    width: 10,
                    height: 10,
                    decoration: BoxDecoration(
                      color: Colors.orange,
                      shape: BoxShape.circle,
                    ),
                  ),
                  SizedBox(width: 5),
                  Text(
                    'Comics Populaires',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.white),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 200, // Height of the horizontal list
              child: Stack(
                children: [
                  ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: comics.length,
                    itemBuilder: (BuildContext context, int index) {
                      final comic = comics[index];
                      return Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(10),
                          child: Container(
                            color: Color(0xFF1E3243), // Changement de couleur de fond
                            width: 150, // Width of each comic card
                            child: InkWell(
                              onTap: () {
                                Navigator.of(context).push(
                                  MaterialPageRoute(
                                    builder: (context) => ComicDetailPage(comic: comic, selectedCategory: 'histoire',),
                                  ),
                                );
                              },
                              child: ComicCard(comic: comic, rank: index + 1),
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                  Positioned(
                    top: 10,
                    right: 10,
                    child: ElevatedButton(
                      onPressed: () {

                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => ComicsPage()),
                          );


                        // Handle the "Voir plus" button tap
                      },
                      child: Text('Voir plus', style: TextStyle(fontSize: 16)),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );

  }
}
