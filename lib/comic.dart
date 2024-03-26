class Comic {
  final String title;
  final String? description;
  final String imageUrl;
  final int issueNumber;
  final String releaseDate;

  Comic({
    required this.title,
    this.description,
    required this.imageUrl,
    required this.issueNumber,
    required this.releaseDate,
  });

  // If you're using mock data for now, you can create a mock constructor like this:
  factory Comic.mock() {
    return Comic(
      title: 'Titre du comic',
      description: 'Courte description',
      imageUrl: 'images/ic_movie_bicolor.png', // Replace with a real image path or URL
      issueNumber: 1,
      releaseDate: 'Jan 2020',
    );
  }
}
