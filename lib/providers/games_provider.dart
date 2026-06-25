import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../data/database_helper.dart';
import '../data/games_data.dart';
import '../models/game.dart';

// Remplacez ce corps par un appel Supabase réel (ex: depuis la Séance 7)
Future<List<Game>> _fetchFromNetwork() async {
  // Simuler un appel réseau (à remplacer par: await supabase.from('games').select())
  await Future.delayed(const Duration(milliseconds: 800));
  return gamesData;
}

final gamesProvider = FutureProvider<List<Game>>((ref) async {
  try {
    // 1. Tentative réseau
    final games = await _fetchFromNetwork();

    // 2. Mise à jour du cache SQLite en arrière-plan
    DatabaseHelper().insertGames(games);

    return games;
  } catch (_) {
    // 3. Fallback : lecture depuis SQLite si pas de réseau
    final cached = await DatabaseHelper().getCachedGames();
    if (cached.isEmpty) rethrow;
    return cached;
  }
});
