import 'package:flutter/material.dart';
import 'package:projet_prog_mobile/comic.dart'; // Adjust the path to where your Comic class is defined

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
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              // Image for the comic cover
              Image.asset(
                comic.imageUrl,
                width: 100,
                height: 150,
                fit: BoxFit.cover,
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(8),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        comic.titre,
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                          fontSize: 16,
                        ),
                      ),
                      Text(
                        comic.description,
                        style: const TextStyle(
                          fontStyle: FontStyle.italic,
                          color: Colors.white,
                          fontSize: 16,
                        ),
                      ),
                      // Row for the issue number with the logo
                      Row(
                        children: [
                          // Logo for the issue number
                          Image.asset(
                            'images/ic_books_bicolor.png', // Chemin vers votre image
                            width: 20,
                            height: 20,
                            color: Colors.white,
                          ),
                          SizedBox(width: 8), // Spacer between the logo and the text
                          // Text for the issue number
                          Text(
                            '№ ${comic.issueNumber}',
                            style: TextStyle(
                              color: Colors.white.withOpacity(0.7),
                              fontSize: 14,
                            ),
                          ),
                        ],
                      ),
                      // Row for the release date with the logo
                      Row(
                        children: [
                          // Logo for the release date
                          Image.asset(
                            'images/ic_calendar_bicolor.png', // Chemin vers votre image
                            width: 20,
                            height: 20,
                            color: Colors.white,
                          ),
                          SizedBox(width: 8), // Spacer between the logo and the text
                          // Text for the release date
                          Text(
                            comic.releaseDate,
                            style: TextStyle(
                              color: Colors.white.withOpacity(0.7),
                              fontSize: 12,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
        Positioned( // Add this widget to position the rank
          top: 10,
          left: 10,
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 2),
            decoration: BoxDecoration(
              color: Colors.orange, // Change to the color you want
              borderRadius: BorderRadius.circular(20), // Rounded edges
            ),
            child: Text(
              '#$rank', // Show the rank number
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
