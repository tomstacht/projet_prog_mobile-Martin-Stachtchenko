import 'dart:convert';
import 'package:flutter/material.dart';
import 'serie_card.dart';
import 'models/serie.dart';
import 'serie_detail_page.dart';
import 'config.dart';
import 'package:http/http.dart' as http;

class SeriesPage extends StatefulWidget {
  @override
  _SeriesPageState createState() => _SeriesPageState();
}

class _SeriesPageState extends State<SeriesPage> {
  List<Serie> series = [];
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    fetchSeries();
  }

  Future<void> fetchSeries() async {
    final String apiKey = Config.comicVineApiKey;
    final String seriesEndpoint = 'movies';
    final String apiUrl = 'https://comicvine.gamespot.com/api/$seriesEndpoint?api_key=$apiKey&format=json';

    try {
      final response = await http.get(Uri.parse(apiUrl));

      if (response.statusCode == 200) {
        final List<dynamic> serieData = json.decode(response.body)['results'];
        final List<Serie> series = serieData.map((serieJson) => Serie.fromJson(serieJson)).toList();

        setState(() {
          this.series = series;
          isLoading = false;
        });
      } else {
        print('Erreur lors de la récupération des series: ${response.statusCode}');
        setState(() {
          isLoading = false;
        });
      }
    } catch (e) {
      print('Erreur lors de la récupération des series: $e');
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
              ...series.map((serie) {
                return GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => SerieDetailPage(serie: serie, selectedCategory: 'personnages')),
                    );
                  },
                  child: SerieCard(serie: serie, rank: series.indexOf(serie) + 1),
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
        'Séries les plus populaires',
        style: TextStyle(
          fontWeight: FontWeight.bold,
          color: Colors.white,
          fontSize: 30,
        ),
      ),
    );
  }
}
