import 'package:flutter/material.dart';
import 'package:projet_prog_mobile/models/comic.dart'; // Adjust the path to where your Comic class is defined

class ComicCard extends StatelessWidget {
  final Comic comic;
  final int rank; // Add this line

  const ComicCard({
    required this.comic,
    required this.rank, // Add this line
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          margin: const EdgeInsets.all(8),
          decoration: BoxDecoration(
            color: Colors.white.withOpacity(0.1), // Slightly transparent white card
            borderRadius: BorderRadius.circular(8),
          ),
          child: IntrinsicHeight( // Wrap Row with IntrinsicHeight
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Image.network(
                  comic.imageUrl, // Change Image.asset to Image.network
                  width: 100,
                  height: 150,
                  fit: BoxFit.cover,
                ),
                Flexible( // Use Flexible instead of Expanded
                  child: Padding(
                    padding: const EdgeInsets.all(8),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          comic.name,
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                            fontSize: 16,
                          ),
                        ),
                        Text(
                          comic.description ?? 'Description non disponible',
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                            fontSize: 16,
                          ),
                          overflow: TextOverflow.ellipsis, // Prevent overflow
                          maxLines: 3, // Limit the number of lines
                        ),
                        Text(
                          '№ ${comic.issueNumber}',
                          style: TextStyle(
                            color: Colors.white.withOpacity(0.7),
                            fontSize: 14,
                          ),
                        ),
                        Text(
                          comic.coverDate,
                          style: TextStyle(
                            color: Colors.white.withOpacity(0.7),
                            fontSize: 12,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        Positioned(
          top: 10,
          left: 10,
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 2),
            decoration: BoxDecoration(
              color: Colors.orange,
              borderRadius: BorderRadius.circular(20),
            ),
            child: Text(
              '#$rank',
              style: const TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
