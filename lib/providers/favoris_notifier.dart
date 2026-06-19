import 'package:flutter/foundation.dart';

class FavorisNotifier extends ChangeNotifier {
  static final FavorisNotifier instance = FavorisNotifier._();
  FavorisNotifier._();

  final Set<int> _favoris = {};

  bool isFavori(int gameId) => _favoris.contains(gameId);

  void toggleFavori(int gameId) {
    if (_favoris.contains(gameId)) {
      _favoris.remove(gameId);
    } else {
      _favoris.add(gameId);
    }
    notifyListeners();
  }
}
