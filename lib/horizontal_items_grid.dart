import 'package:flutter/material.dart';
import 'series_card.dart'; // Import the SeriesCard widget
import 'comic.dart'; // This should be the model you use for series data.
import 'serie.dart'; // This should be the model you use for series data.


class HorizontalItemGrid extends StatelessWidget {
  final List<Comic> comics;

  const HorizontalItemGrid({super.key, required this.comics});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 200, // Set the height to fit the design
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: comics.length,
        itemBuilder: (context, index) {
          return SeriesCard(serie: series[index]);
        },
      ),
    );
  }
}
