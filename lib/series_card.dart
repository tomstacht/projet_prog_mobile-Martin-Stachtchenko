import 'package:flutter/material.dart';
import 'comic.dart';
import 'comic_detail_page.dart'; // Assurez-vous que cette page est correctement créée

class SeriesCard extends StatelessWidget {
  final Comic serie;

  const SeriesCard({super.key, required this.serie});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        // La navigation se déclenche ici
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => ComicDetailPage(comic: serie)),
        );
      },
      child: Card(
        color: const Color(0xFF1E3243),
        child: Column(
          children: <Widget>[
            Image.network(
              serie.imageUrl,
              fit: BoxFit.cover,
              errorBuilder: (BuildContext context, Object exception, StackTrace? stackTrace) {
                return const Icon(Icons.error); // Placeholder for errors
              },
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(serie.title, style: const TextStyle(color: Colors.white)),
            ),
            // ... other card details
          ],
        ),
      ),
    );
  }
}
