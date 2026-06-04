class User {
  final String firstName;
  final String lastName;
  final int age;
  final String profileImageUrl;
  final bool isPremium;
  final List<String> preferredGenres;

  User({
    required this.firstName,
    required this.lastName,
    required this.age,
    required this.profileImageUrl,
    required this.isPremium,
    required this.preferredGenres,
  });
}
