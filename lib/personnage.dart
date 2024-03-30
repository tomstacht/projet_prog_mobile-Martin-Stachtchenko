class Personnage {
  final String nomsuperheros;
  final String nomreel;
  final String alias;
  final String editeur;
  final String createur;
  final String imageUrl;
  final String genre;
  final String datenaissance;
  final String datedeces;
  final String histoire;

  Personnage({
    required this.nomreel,
    required this.nomsuperheros,
    required this.histoire,
    required this.alias,
    required this.editeur,
    required this.createur,
    required this.imageUrl,
    required this.genre,
    required this.datedeces,
    required this.datenaissance,
  });

  // If you're using mock data for now, you can create a mock constructor like this:
  factory Personnage.mock() {
    return Personnage(
      nomreel: 'Nom réel',
      nomsuperheros: 'Nom de super-héros',
      histoire: 'Histoire',
      alias: 'Alias', // Exemple de liste de personnages
      editeur: 'Editeur',
      createur: 'Créateur',
      genre: 'Genre',
      imageUrl: 'images/astronaut.png', // Replace with a real image path or URL
      datenaissance: 'Jan 2020',
      datedeces: 'Fev 2020',
    );
  }
}
