import 'character.dart';

class Serie {
  final String id;
  final String name;
  final String imageUrl;
  final String publisher;
  final int countOfEpisodes;
  final String startYear;
  final String apiDetailUrl;
  final String description;
  final List<Character> characters;

  Serie({
    required this.id,
    required this.name,
    required this.imageUrl,
    required this.publisher,
    required this.countOfEpisodes,
    required this.startYear,
    required this.apiDetailUrl,
    required this.description,
    required this.characters,
  });

  factory Serie.fromJson(Map<String, dynamic> json) {
    String defaultImageUrl = 'https://www.placecage.com/200/300';
    return Serie(
      id: json['id']?.toString() ?? '0000',
      name: json['name']?.toString() ?? 'Unknown',
      imageUrl: json['image'] != null ? json['image']['original_url'] ?? defaultImageUrl : defaultImageUrl,
      publisher: json['publisher'] != null ? json['publisher']['name']?.toString() ?? 'Unknown' : 'Unknown',
      countOfEpisodes: json['count_of_episodes']?.toInt() ?? 0,
      startYear: json['start_year']?.toString() ?? 'Unknown',
      apiDetailUrl: json['api_detail_url']?.toString() ?? '',
      description: json['description']?.toString() ?? 'No description available.',
      characters: (json['characters'] as List<dynamic>?)?.map((e) => Character.fromJson(e as Map<String, dynamic>)).toList() ?? [],
    );
  }
}
