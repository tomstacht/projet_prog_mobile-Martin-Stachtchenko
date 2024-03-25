class Comic {
  final String title;
  final String imageUrl;

  Comic(this.title, this.imageUrl);

  // Mock method to generate example data
  factory Comic.mock() {
    return Comic('Comic Title', 'https://placekitten.com/200/300'); // Placeholder image URL
  }
}
