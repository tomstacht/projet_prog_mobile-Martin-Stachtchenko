import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'serie_card.dart';
import 'models/series.dart'; // Ensure this path is correct

class SeriesPage extends StatefulWidget {
  @override
  _SeriesPageState createState() => _SeriesPageState();
}

class _SeriesPageState extends State<SeriesPage> {
  late Future<List<Series>> futureSeries;

  @override
  void initState() {
    super.initState();
    futureSeries = fetchSeries();
  }

  Future<List<Series>> fetchSeries() async {
    final response = await http.get(
      Uri.parse( 'https://comicvine.gamespot.com/api/series_list?api_key=${Config.comicVineApiKey}&format=json&limit=$limit&offset=$offset&field_list=id,name,image,publisher,count_of_episodes,start_year,api_detail_url' ),
      headers: {
        'Accept': 'application/json',
      },
    );

    if (response.statusCode == 200) {
      List<dynamic> seriesJson = json.decode(response.body)['results'];
      return seriesJson.map((json) => Series.fromJson(json)).toList();
    } else {
      throw Exception('Failed to load series from API');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF15232E),
      appBar: AppBar(
        title: Text('Séries les plus populaires'),
        backgroundColor: Color(0xFF15232E),
        elevation: 0,
      ),
      body: FutureBuilder<List<Series>>(
        future: futureSeries,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text("Error: ${snapshot.error}"));
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return Center(child: Text("No series found"));
          }
          return ListView.builder(
            itemCount: snapshot.data!.length,
            itemBuilder: (context, index) {
              final series = snapshot.data![index];
              return SerieCard(
                serie: series,
                rank: index + 1, // Adding rank based on the index
              );
            },
          );
        },
      ),
    );
  }
}
