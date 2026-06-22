class Game {
  final int id;
  final String title;
  final String description;
  final String imageUrl;
  final String genre;
  final double price;
  final bool isFree;

  Game({
    required this.id,
    required this.title,
    required this.description,
    required this.imageUrl,
    required this.genre,
    required this.price,
    this.isFree = false,
  });

  factory Game.fromJson(Map<String, dynamic> json) {
    return Game(
      id: json['id'] as int,
      title: json['title'] as String,
      description: json['description'] as String,
      imageUrl: json['image_url'] as String,
      genre: json['genre'] as String,
      price: (json['price'] as num).toDouble(),
      isFree: json['is_free'] as bool? ?? false,
    );
  }
}
