class Comic {
  final String titre;
  final List<String> auteurs;
  final String histoire;
  final List<String> personnages;
  final int id;
  final String description;
  final String imageUrl;
  final int issueNumber;
  final String releaseDate;

  Comic({
    required this.titre,
    required this.auteurs,
    required this.histoire,
    required this.personnages,
    required this.id,
    required this.description,
    required this.imageUrl,
    required this.issueNumber,
    required this.releaseDate,
  });

  // If you're using mock data for now, you can create a mock constructor like this:
  factory Comic.mock() {
    return Comic(
      id: 1,
      auteurs: ['Auteur1', 'Auteur2'],
      titre: 'Titre du comic',
      histoire: 'Histoire',
      personnages: ['Personnage1', 'Personnage2'], // Exemple de liste de personnages
      description: 'Courte description',
      imageUrl: 'images/astronaut.png', // Replace with a real image path or URL
      issueNumber: 1,
      releaseDate: 'Jan 2020',
    );
  }
}
