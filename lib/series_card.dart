import 'package:flutter/material.dart';
import 'comic.dart'; // This should be the model you use for series data.

class SeriesCard extends StatelessWidget {
  final Comic serie;

  const SeriesCard({super.key, required this.serie});

  @override
  Widget build(BuildContext context) {
    // The build method must return a Widget.
    return Card(
      color: const Color(0xFF1E3243),
      child: Column(
        children: <Widget>[
          // Use a placeholder image for now
          Image.network(
            serie.imageUrl,
            fit: BoxFit.cover,
            // In case the image doesn't load, you can provide an error widget.
            errorBuilder: (BuildContext context, Object exception, StackTrace? stackTrace) {
              return const Icon(Icons.error); // Placeholder for an errors.
            },
          ),
          Text(serie.title, style: const TextStyle(color: Colors.white)),
          // ... other card details
        ],
      ),
    );
  }
}
