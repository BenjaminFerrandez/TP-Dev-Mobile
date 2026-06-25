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

  Map<String, dynamic> toMap() => {
        'id': id,
        'title': title,
        'description': description,
        'imageUrl': imageUrl,
        'genre': genre,
        'price': price,
        'isFree': isFree ? 1 : 0,
      };

  factory Game.fromMap(Map<String, dynamic> map) => Game(
        id: map['id'] as int,
        title: map['title'] as String,
        description: map['description'] as String,
        imageUrl: map['imageUrl'] as String,
        genre: map['genre'] as String,
        price: (map['price'] as num).toDouble(),
        isFree: (map['isFree'] as int) == 1,
      );
}
