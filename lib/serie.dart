class Serie {
  final String titre;
  final String auteur;
  final String histoire;
  final List<String> personnages;
  final int id;
  final String description;
  final String imageUrl;
  final int issueNumber;
  final String releaseDate;

  Serie({
    required this.titre,
    required this.auteur,
    required this.histoire,
    required this.personnages,
    required this.id,
    required this.description,
    required this.imageUrl,
    required this.issueNumber,
    required this.releaseDate,
  });

  // If you're using mock data for now, you can create a mock constructor like this:
  factory Serie.mock() {
    return Serie(
      id: 1,
      auteur: 'auteur',
      titre: 'Titre de la série',
      histoire: 'Histoire',
      personnages: ['Personnage1', 'Personnage2'], // Exemple de liste de personnages
      description: 'Courte description',
      imageUrl: 'images/astronaut.png', // Replace with a real image path or URL
      issueNumber: 1,
      releaseDate: 'Jan 2020',
    );
  }
}
