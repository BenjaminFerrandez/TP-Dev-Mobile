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
}
