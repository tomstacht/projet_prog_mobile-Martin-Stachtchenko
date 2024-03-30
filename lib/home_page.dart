import 'package:flutter/material.dart';
import 'horizontal_items_grid.dart';
import 'comic.dart';
import 'section.dart';
import 'serie.dart';
import 'film.dart';
import 'item_card.dart'; // Importez la classe ItemCard
import 'comic_detail_page.dart'; // Importez la classe ItemCard
import 'serie_detail_page.dart'; // Importez la classe ItemCard
import 'film_detail_page.dart'; // Importez la classe ItemCard

class HomePage extends StatelessWidget {
  final List<Serie> mockSeries = List.generate(10, (index) => Serie.mock());
  final List<Comic> mockComics = List.generate(10, (index) => Comic.mock());
  final List<Film> mockFilms = List.generate(10, (index) => Film.mock());

  @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color(0xFF15232E), // Définissez la couleur d'arrière-plan
      child: SingleChildScrollView(
        child: Column(
          children: [
            _buildHeader(),
            Section(
              title: 'Séries populaires',
              child: HorizontalItemGrid<Serie>(
                items: mockSeries,
                itemBuilder: (serie) => ItemCard<Serie>(
                  item: serie,
                  imageUrlField: serie.imageUrl,
                  titleField: serie.titre,
                  category: 'Série',
                  onTap: (item) {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => SerieDetailPage(serie: item, selectedCategory: 'histoire',),
                      ),
                    );
                    // Logique à exécuter lors du clic sur la carte de série
                  },
                ),
              ),
            ),
            Section(
              title: 'Comics populaires',
              child: HorizontalItemGrid<Comic>(
                items: mockComics,
                itemBuilder: (comic) => ItemCard<Comic>(
                  item: comic,
                  imageUrlField: comic.imageUrl,
                  titleField: comic.titre,
                  category: 'Comic',
                  onTap: (item) {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => ComicDetailPage(comic: item, selectedCategory: 'histoire',),
                      ),
                    );
                    // Logique à exécuter lors du clic sur la carte de comic
                  },
                ),
              ),
            ),
            Section(
              title: 'Films populaires',
              child: HorizontalItemGrid<Film>(
                items: mockFilms,
                itemBuilder: (film) => ItemCard<Film>(
                  item: film,
                  imageUrlField: film.imageUrl,
                  titleField: film.titre,
                  category: 'Film',
                  onTap: (item) {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => FilmDetailPage(film: item, selectedCategory: 'synopsis',),
                      ),
                    );
                    // Logique à exécuter lors du clic sur la carte de film
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildHeader() {
    return Row(
      children: <Widget>[
        const Padding(
          padding: EdgeInsets.only(left: 10),
          child: Text(
            'Bienvenue !',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              color: Colors.white,
              fontSize: 40,
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 70),
          child: Image.asset(
            'images/astronaut.png',
            height: 159,
            width: 121,
          ),
        ),
      ],
    );
  }
}
