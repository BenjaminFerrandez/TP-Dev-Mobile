import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../providers/games_provider.dart';
import '../widgets/game_card.dart';

class BoutiqueScreen extends ConsumerWidget {
  const BoutiqueScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final gamesAsync = ref.watch(gamesProvider);

    return gamesAsync.when(
      loading: () => const Center(child: CircularProgressIndicator()),
      error: (error, _) => Center(child: Text('Erreur : $error')),
      data: (games) => ListView.builder(
        itemCount: games.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.all(16.0),
            child: GameCard(game: games[index]),
          );
        },
      ),
    );
  }
}
