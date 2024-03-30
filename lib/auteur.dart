class Auteur {
  final String nom;
  final String bio;
  final String imageUrl;
  final String genre;
  final String datenaissance;
  final String datedeces;
  final String activite;

  Auteur({
    required this.nom,
    required this.bio,
    required this.activite,
    required this.imageUrl,
    required this.genre,
    required this.datedeces,
    required this.datenaissance,
  });

  // If you're using mock data for now, you can create a mock constructor like this:
  factory Auteur.mock() {
    return Auteur(
      nom: 'Nom réel',
      bio: 'Courte bio',
      activite: 'Dessin ou  editeur...',
      genre: 'Genre',
      imageUrl: 'images/astronaut.png', // Replace with a real image path or URL
      datenaissance: 'Jan 2020',
      datedeces: 'Fev 2020',
    );
  }
}
